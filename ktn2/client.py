# -*- coding: utf-8 -*-
import socket
import json
from MessageWorker import ReceiveMessageWorker
import sys, readline

class Client(object):

    def __init__(self):
        # Initialiser en tilkobling
        self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        
        self.messageWorker = ReceiveMessageWorker(self, self.connection)
        
        
    def printBacklog(self,backlog):
        for linje in backlog:
                print(linje)
    
    def start(self, host, port):
        # Start tilkoblingen
        self.connection.connect((host, port))

		# Start MessageWorker
		
        # Be brukeren om å skrive inn brukernavn
        
        canLogIn = False
        
        while not canLogIn:
        
                nick = raw_input('Enter your username: ')
        
                data = {'request': 'login', 'username': nick}
                data = json.dumps(data)
                self.send(data)
        
                received_data = self.connection.recv(1024)
                data = json.loads(received_data)
        
                if(data.get('error')):
                        error = data['error']
                        if(error == 'Name allready taken!'):
                                print(error)
                                
                        elif(error == 'Invalid username'):
                                print(error)
                        print('Try another')
                else:
                        print('Logged in as ' + data['username'])
                        canLogIn = True
                        backlog = data['messages']
                        self.printBacklog(backlog)

        message = ''

        self.messageWorker.start()

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
            data = {'nick': nick, 'message': message}

            # Lag en streng av JSON-objektet
            data = json.dumps(data)

            # Send meldingen til serveren
            self.send(data)
			
			
    # Lag en metode for å sende en melding til serveren
    def send(self, data):
        self.connection.send(data)

    def message_received(self, message):
		#print message
		self.printline(message)
		
    def printline(self, line):
		sys.stdout.write('\r'+' '*(len(readline.get_line_buffer())+3)+'\r')
		print line
		sys.stdout.write('> ' + readline.get_line_buffer())
		sys.stdout.flush()
	
	
# Kjøres når programmet startes
if __name__ == "__main__":
    # Definer host og port for serveren
    HOST = 'localhost'
    PORT = 9999

    # Initialiser klienten
    client = Client()

    # Start klienten
    client.start(HOST, PORT)
