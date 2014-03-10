'''
KTN-project 2013 / 2014
Python daemon thread class for listening for events on
a socket and notifying a listener of new messages or
if the connection breaks.
'''
from threading import Thread


class ReceiveMessageWorker(Thread):
        
        

	def __init__(self, listener, connection):
		# Initialize super class
		super(ReceiveMessageWorker, self).__init__()
		
		# Set thread as daemon to make python shut down properly on exit
		self.daemeon = True
		self.isRunning = True
		
		self.listener = listener
		self.connection = connection
	
	def shutdown(self):
	        self.isRunning = False

        def splitAndSendMessage(self,data):
                array = data.split("}{")s
                for linje in array:
                        updatedLine = linje
                        if not linje[0] == '{':
                                updatedLine = '{' +  updatedLine

                        if not linje[-1] == '}':
                                updatedLine = updatedLine + '}'
                        self.listener.dataReceived(updatedLine)
                
	
	def run(self):
		while self.isRunning:
			data = self.connection.recv(1024)
			if not data: continue
			
			self.splitAndSendMessage(data)
			#self.listener.dataReceived(data)
			
			
			