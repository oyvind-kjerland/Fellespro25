# -*- coding: utf-8 -*-
import SocketServer
import socket
import json
import re
from datetime import datetime


class CLientHandler(SocketServer.BaseRequestHandler):
	
    def isUserLoggedIn(self,nickname):
	    return nickname in server.users

    def send(self, data):
		self.request.send(data)
	
    def isUsernameValid(self,username):
	    return re.match('^[\w-]+$', username) and len(username) < self.maxUsernameLength
	   
    def logoutUser(self):
            if self.username not in server.users:
                    print "User tried to log out, but not logget in"
                    data = {'response': 'logout',  'error' : 'You are not logged in!'}
	            data = json.dumps(data)
	            self.send(data)
	            return
            
            
	    data = {'response': 'logout', 'username': self.username}
	    data = json.dumps(data)
	    self.send(data)
	    self.removeUser()
		
    def removeUser(self):
            if self.username not in server.users:
                    print "User tried to log out, but not logget inn"
                    return
            
	    del server.users[self.username]
	    
	    message =  self.getDateAndTime() + ' User ' + self.username + ' logged out '
	    self.printAndAddMessageToBacklog(message)

	    
	    data = {'response': 'message',  'message' : message}
	    data = json.dumps(data)
	    self.sendDataToAllUsers(data)
	    
    def printAndAddMessageToBacklog(self,message):
	    print message
	    server.backlog.append(message)
	    
    def checkMessage(self,message):
	    if "} {" in message:
		    print("User type } {. Message Changed.")
		    index = message.find("} {") + 1
		    return message[:index] + ' ' + message[index:]
	    return message
	   
    def logInUser(self,username):
	    server.users[username] = self.request
	    self.username = username;
	    data = {'response': 'login', 'username': username , 'messages' : server.backlog}
	    data = json.dumps(data)
	    self.send(data)
	    
	    print(self.getDateAndTime() + ' '+self.ip + ':' + str(self.port) + 
	    ' Logged in as: ' + username + '. ' + str(len(server.users)) + ' users online')

	    message =  self.getDateAndTime() + ' ' + username + ' logged in. ' + str(len(server.users)) + ' users online'
	    data = {'response': 'message',  'message' : message}
	    data = json.dumps(data)
	    self.sendDataToAllUsers(data)
	    
    def sendDataToAllUsers(self,data):
	    for username in server.users:
		    server.users[username].sendall(data)

    def getDateAndTime(self):
	    return datetime.now().strftime("%Y-%m-%d %H:%M")


    def broadcastMessage(self,message):
	    message =  self.getDateAndTime() + ' ' + self.username + ': ' + message
	    self.printAndAddMessageToBacklog(message)
	     
	    data = {'response': 'message',  'message' : message}
	    data = json.dumps(data)
	    self.sendDataToAllUsers(data)

    def handle(self):
	# Hent IP-adressen til klienten
	self.ip = self.client_address[0]
	self.username = None
	self.port = self.client_address[1]
	
	self.maxUsernameLength = 20
	
	print 'Client connected @' + self.ip + ':' + str(self.port)
	
	while True:
		try:
			data = self.request.recv(1024)
			if not data: break
			data = json.loads(data)
			if(not data.get('request')): continue
		
		
			if(data['request'] == 'login'):
				newUsername = data['username']
				
				#Is username valid
				if self.isUsernameValid(newUsername):
					
					#User can log in
					if not self.isUserLoggedIn(newUsername):
						self.logInUser(newUsername)
					
					#Username is taken
					else:
						data = {'response': 'login','error':'Name allready taken!', 'username': newUsername}
						data = json.dumps(data)
						self.send(data)
						print(self.ip + ':' + str(self.port) + " Tried to log in as " + newUsername + ". Username taken")
						
				#Username is not valid	   
				else:
					data = {'response': 'login','error':'Username not valid!', 'username': newUsername}
					data = json.dumps(data)
					self.send(data)
					print(self.ip + ':' + str(self.port) + " Tried to log in as " + newUsername + ". Username not valid")  

			#log out user
			elif(data['request'] == 'logout'):
				if self.isUserLoggedIn(self.username):
					   self.logoutUser() 
			  
			#Recive message and send it to all connected users
			elif(data['request'] == 'message'):
				if self.isUserLoggedIn(self.username):
					message = self.checkMessage(data['message'])
					self.broadcastMessage(message)
				else:
					 print(self.ip + ':' + str(self.port) + " Not logged in. Tried to send: " + data['message'] )
					 data = {'response': 'message',  'error' : 'You are not logged in!'}
					 data = json.dumps(data)
					 self.send(data)
		except socket.error:
			print "User disconnected"
			self.removeUser()
			break
	    

class ThreadedTCPServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
	def init(self):
		self.backlog = []
		self.users = {}


# Kjøres når programmet starter
if __name__ == "__main__":
	# Definer host og port for serveren
	#HOST = '78.91.38.192'

	#HOST = 'localhost'
	HOST = '78.91.10.63'
	PORT = 9999

	# Sett opp serveren
	server = ThreadedTCPServer((HOST, PORT), CLientHandler)
	server.init()
	
	# Aktiver serveren. Den vil kjøre til den avsluttes med Ctrl+C
	server.serve_forever()

