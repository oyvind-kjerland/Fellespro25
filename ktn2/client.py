# -*- coding: utf-8 -*-
import socket
import json

class Client(object):

    def __init__(self):
        # Initialiser en tilkobling
        self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        
        
        
        
    def printBacklog(self,backlog):
        for linje in backlog:
                print(linje)
    
    def start(self, host, port):
        # Start tilkoblingen
        self.connection.connect((host, port))

        # Be brukeren om å skrive inn brukernavn
        
        canLogIn = False
        
        while not canLogIn:
        
                nick = raw_input('Enter your username: ')
        
                data = {'request': 'login', 'username': nick}
                data = json.dumps(data)
                self.send(data)
                
                data = self.connection.recv(1024)
                data = json.loads(data)
                
                
        
                if(data.get('error')):
                        error = data['error']
                        if(error == 'Name allready taken!'):
                                print(error)
                                
                        elif(error == 'Invalid username'):
                                print(error)
                        print('Try another')
                elif(data.get('response')):
                        if(data['response'] == 'login'):
                                print('Logged in as ' + data['username'])
                                backlog = data['messages']
                                self.printBacklog(backlog)
                                canLogIn = True

        message = ''
        # Så lenge brukeren ikke skriver exit i meldingsfeltet
        # vil programmet spørre etter tekst
        while True:
            message = raw_input('Enter a message (type "exit" to quit): ')

            # Lukk tilkoblingen hvis brukeren skriver "exit"
            if message == 'exit':
                self.send(json.dumps({'nick': nick, 'message': 'I\'m leaving. Goodbye!'}))
                self.connection.close()
                break

            # Konstruer et JSON objekt som som skal
            # sendes til serveren
            data = {'request': 'message', 'message': message}

            # Lag en streng av JSON-objektet
            data = json.dumps(data)

            # Send meldingen til serveren
            self.send(data)

            # Motta data fra serveren
            # Setter maks datastørrelse til 1kb
            received_data = self.connection.recv(1024)

            # Si ifra at klienten har mottatt en melding

    # Lag en metode for å sende en melding til serveren
    def send(self, data):
        self.connection.send(data)


# Kjøres når programmet startes
if __name__ == "__main__":
    # Definer host og port for serveren
    HOST = 'localhost'
    PORT = 9999

    # Initialiser klienten
    client = Client()

    # Start klienten
    client.start(HOST, PORT)
