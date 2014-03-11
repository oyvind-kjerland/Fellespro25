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
		
		self.loggedIn = False
		self.listener = None
		
		
	
	def setListener(self, listener):
		self.listener = listener
	
	
	def start(self, host, port):
		# Start tilkoblingen
		self.connection.connect((host, port))
		
		# Start MessageWorker
		self.messageWorker.start()



		
	def isLoggedIn(self):
		return self.loggedIn
	
	def checkMessage(self,message):
	        if message == 'logout':
	                data = {'request': 'logout'}
        		data = json.dumps(data)
        		self.send(data)
        	else:
        	        self.sendMessage(message)
	
	def sendMessage(self, message):
		# Konstruer et JSON objekt som som skal
		# sendes til serveren
		data = {'request': 'message', 'message': message}

		# Lag en streng av JSON-objektet
		data = json.dumps(data)

		self.send(data)
	
	def printDebugMessage(self,message):
	        self.listener.addMessage(message)
	
	# Lag en metode for å sende en melding til serveren
	def send(self, data):
		self.connection.send(data)

	def dataReceived(self, data):
	        if not data: return
		data = json.loads(data)
		
		if(data.get('error')):
		        error = data['error']
			self.listener.addMessage(error)
		
		elif not self.loggedIn:	
			if(data.get('response')):
				if(data['response'] == 'login'):
					self.listener.addMessage('Logged in as ' + data['username'])
					self.loggedIn = True
					self.showBackLog(data['messages'])
					#backlog = data['messages']
					#self.printBacklog(backlog)
					
		elif self.loggedIn:
			if(data.get('response')):
				if(data['response'] == 'message'):
					self.listener.addMessage(data['message'])
		
                		elif(data['response'] == 'logout'):
                                        
                                        #Stopper alt
                			self.loggedIn = False;
                			self.listener.shutDown()
                			self.messageWorker.shutdown()
                			self.connection.close()
                			self.listener.addMessage('You logged out')
                			sys.exit()
                			
        def showBackLog(self,messages):
                for message in messages:
                        self.listener.addMessage(message)
			
	def login(self, nick):
		data = {'request': 'login', 'username': nick}
		data = json.dumps(data)
		self.send(data)
