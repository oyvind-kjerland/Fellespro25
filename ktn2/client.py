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

			

			
	def isLoggedIn(self):
		return self.loggedIn
	
	
	def sendMessage(self, message):
		# Konstruer et JSON objekt som som skal
		# sendes til serveren
		data = {'request': 'message', 'message': message}

		# Lag en streng av JSON-objektet
		data = json.dumps(data)

		# Send meldingen til serveren
		self.send(data)
	
	
	
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