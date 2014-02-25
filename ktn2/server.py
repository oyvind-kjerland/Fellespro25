# -*- coding: utf-8 -*-
import SocketServer
import json
from datetime import datetime

backlog = ['Hei','heisann']
users = ['admin']

class CLientHandler(SocketServer.BaseRequestHandler):

    def send(self, data):
        self.request.send(data)

    def handle(self):
        # Hent IP-adressen til klienten
        self.ip = self.client_address[0]
        
        nickname = 'not set'
        

        # Hent portnummeret til klienten
        self.port = self.client_address[1]

        # Si ifra at en ny klient har koblet til serveren
        print 'Client connected @' + self.ip + ':' + str(self.port)
        
        
        
        while True:
        
                data = self.request.recv(1024)
                
                if not data: break
                
                data = json.loads(data)
                global backlog
                
                if(not data.get('request')): continue
        
                if(data['request'] == 'login'):
                        username = data['username']
                        if username not in users:
                                users.append(username)
                                nickname = username;
                                
                                data = {'response': 'login', 'username': username , 'messages' : backlog}

                                data = json.dumps(data)
                                self.send(data)
                                print(self.ip + ':' + str(self.port) + " Logged in as: " + username)
                                
                                
                        else:
                                data = {'response': 'login','error':'Name allready taken!', 'username': username}
                                data = json.dumps(data)
                                self.send(data)
                                print(self.ip + ':' + str(self.port) + " Tried to log in as " + username + ". Username taken")
                
                
                elif(data['request'] == 'message'):
                        message =  datetime.now().strftime("%Y-%m-%d %H:%M") + ' ' + nickname + ': ' + data['message']
                        print message
                        backlog.append(message)
                        
                        data = {'response': 'message',  'message' : message}
                        data = json.dumps(data)
                        self.send(data)
                        
                        
        #self.request.sendall(backlog)

        while True:
            # Motta data fra klienten
            # Setter maks datastørrelse til 1kb
            data = self.request.recv(1024)

            # Avslutt hvis serveren ikke mottar data fra klienten
            if not data: break

            # Last inn JSON-objektet
            data = json.loads(data)

            # Si ifra at klienten har sendt en melding
            print datetime.now().strftime("%Y-%m-%d %H:%M") + ' ' + data['nick'] + ': ' + data['message']
            
            backlog += data['message'] + ", "

            # Send en melding til klienten om at meldingen ble mottatt
            #self.request.sendall('Message received')


class ThreadedTCPServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    pass


# Kjøres når programmet starter
if __name__ == "__main__":
    # Definer host og port for serveren
    HOST = 'localhost'
    PORT = 9999

    # Sett opp serveren
    server = ThreadedTCPServer((HOST, PORT), CLientHandler)

    # Aktiver serveren. Den vil kjøre til den avsluttes med Ctrl+C
    server.serve_forever()

