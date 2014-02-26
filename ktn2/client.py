# -*- coding: utf-8 -*-
import socket
import json
from MessageWorker import ReceiveMessageWorker
import sys

class Client(object):

	def __init__(self):
		# Initialiser en tilkobling
		self.connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		
		self.messageWorker = ReceiveMessageWorker(self, self.connection)
		
<<<<<<< HEAD
		self.loggedIn = False
		self.listener = None
		
		
	
	def setListener(self, listener):
		self.listener = listener
	
	
	def start(self, host, port):
		# Start tilkoblingen
		self.connection.connect((host, port))
		
		# Start MessageWorker
		self.messageWorker.start()
=======
        # Be brukeren om å skrive inn brukernavn
        
        canLogIn = False
        
        while not canLogIn:
        
                nick = raw_input('Enter your username: ')
                print('')
        
                data = {'request': 'login', 'username': nick}
                data = json.dumps(data)
                self.send(data)
                
                data = self.connection.recv(1024)
                data = json.loads(data)
                
                
        
                if(data.get('error')):
                        error = data['error']
                        if(error == 'Name allready taken!'):
                                print(error)
                                print('')
                                
                        elif(error == 'Invalid username'):
                                print(error)
                                print('')
                        print('Try another')
                elif(data.get('response')):
                        if(data['response'] == 'login'):
                                print('Logged in as ' + data['username'])
                                backlog = data['messages']
                                print('')
                                self.printBacklog(backlog)
                                print('')
                                print('Type and press enter to send')
                                print('')
                                canLogIn = True

        message = ''
        message2 = nick + ": " 
        
        # Start MessageWorker
        self.messageWorker.start()

        # Så lenge brukeren ikke skriver exit i meldingsfeltet
        # vil programmet spørre etter tekst
        while True:
            message = raw_input()
>>>>>>> 5405b8543e91cd1715d923e2985f6e0cde68a6b1

	def logout(self):
		# Så lenge brukeren ikke skriver exit i meldingsfeltet
		# vil programmet spørre etter tekst
		while True:
			message = raw_input("")

			# Lukk tilkoblingen hvis brukeren skriver "exit"
			if message == 'exit':
				self.send(json.dumps({'nick': nick, 'message': 'I\'m leaving. Goodbye!'}))
				self.connection.close()
				break

			

<<<<<<< HEAD
			
	def isLoggedIn(self):
		return self.loggedIn
	
	
	def sendMessage(self, message):
		# Konstruer et JSON objekt som som skal
		# sendes til serveren
		data = {'request': 'message', 'message': message}
=======
            # Send meldingen til serveren
            self.send(data)
            
            #CURSOR_UP_ONE = '\x1b[1A'
            #ERASE_LINE = '\x1b[2K'
            #print(CURSOR_UP_ONE + ERASE_LINE)
>>>>>>> 5405b8543e91cd1715d923e2985f6e0cde68a6b1

		# Lag en streng av JSON-objektet
		data = json.dumps(data)

<<<<<<< HEAD
		# Send meldingen til serveren
		self.send(data)
=======
    def message_received(self, message):
            data = json.loads(message)
            #print "\033[A                             \033[A"  
            

            print data['message']
            
		
		
>>>>>>> 5405b8543e91cd1715d923e2985f6e0cde68a6b1
	
	
	
	# Lag en metode for å sende en melding til serveren
	def send(self, data):
		self.connection.send(data)

	def dataReceived(self, data):
		data = json.loads(data)
		
		if not self.loggedIn:
			if(data.get('error')):
				error = data['error']
				self.listener.addMessage(error)
				
			elif(data.get('response')):
				if(data['response'] == 'login'):
					self.listener.addMessage('Logged in as ' + data['username'])
					self.loggedIn = True
					#backlog = data['messages']
					#self.printBacklog(backlog)
					
		elif self.loggedIn:
			if(data.get('response')):
				if(data['response'] == 'message'):
					self.listener.addMessage(data['message'])
			
	def login(self, nick):
		data = {'request': 'login', 'username': nick}
		data = json.dumps(data)
		self.send(data)
