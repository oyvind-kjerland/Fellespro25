# -*- coding: utf-8 -*-
import SocketServer
import json
from datetime import datetime

backlog = []
#users = ['admin']
users = {}

class CLientHandler(SocketServer.BaseRequestHandler):
        
    def isUserLoggedIn(self,nickname):
            return nickname in users

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
                        if not self.isUserLoggedIn(username):
                                users[username] = self.request
                                nickname = username;
                                
                                data = {'response': 'login', 'username': username , 'messages' : backlog}

                                data = json.dumps(data)
                                self.send(data)
                                print(datetime.now().strftime("%Y-%m-%d %H:%M") + ' '+self.ip + ':' + str(self.port) + ' Logged in as: ' + username + '. ' + str(len(users)) + ' users online')
                                
                                message =  datetime.now().strftime("%Y-%m-%d %H:%M") + ' ' + username + ' logged in. ' + str(len(users)) + ' users online'
                                
                                
                                data = {'response': 'message',  'message' : message}
                                data = json.dumps(data)
                                #self.send(data)
                        
                                for username in users:
                                        users[username].sendall(data)
                                
                                
                        else:
                                data = {'response': 'login','error':'Name allready taken!', 'username': username}
                                data = json.dumps(data)
                                self.send(data)
                                print(self.ip + ':' + str(self.port) + " Tried to log in as " + username + ". Username taken")
                
                
                elif(data['request'] == 'logout'):
                        if self.isUserLoggedIn(nickname):
                                
                                data = {'response': 'logout', 'username': username}
                                data = json.dumps(data)
                                self.send(data)
                                
                                del users[username]
                                
                                message =  datetime.now().strftime("%Y-%m-%d %H:%M") + ' User ' + nickname + ' logged out '
                                print message
                                backlog.append(message)
                                
                                data = {'response': 'message',  'message' : message}
                                data = json.dumps(data)
                        
                                for username in users:
                                        users[username].sendall(data)
                                
                                
                
                elif(data['request'] == 'message'):
                        if self.isUserLoggedIn(nickname):
                                message =  datetime.now().strftime("%Y-%m-%d %H:%M") + ' ' + nickname + ': ' + data['message']
                                print message
                                backlog.append(message)
                        
                                data = {'response': 'message',  'message' : message}
                                data = json.dumps(data)
                                #self.send(data)
                        
                                for username in users:
                                        users[username].sendall(data)
                        
                        else:
                                 print(self.ip + ':' + str(self.port) + " Not logged in. Tried to send: " + message)
                                 data = {'response': 'message',  'error' : 'You are not logged in!'}
                                 data = json.dumps(data)

            




class ThreadedTCPServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
	pass


# Kjøres når programmet starter
if __name__ == "__main__":
	# Definer host og port for serveren
	#HOST = '78.91.38.192'
	HOST = '78.91.9.70'
	PORT = 9999

	# Sett opp serveren
	server = ThreadedTCPServer((HOST, PORT), CLientHandler)

	# Aktiver serveren. Den vil kjøre til den avsluttes med Ctrl+C
	server.serve_forever()

