import curses
from curses import wrapper
from client import Client
from threading import Lock
import time

class ChatInterface:

	def __init__(self):
		HOST = '78.91.38.192'
		PORT = 9999

		# Initialiser klienten
		self.client = Client()
		self.client.setListener(self)
		# Start klienten
		
		self.client.start(HOST, PORT)
		self.loginDelay = 3
		
		self.queueSize = 5
		self.messageQueue = []
		self.queueLock = Lock()
		self.stdscr = None
		
		
		
		wrapper(self.main)
		
		
		
	def main(self, stdscr):
		# Clear screen
		self.stdscr = stdscr
		stdscr.clear()
		curses.echo()
		
		while True:
			if self.client.isLoggedIn():
				
				stdscr.clear()
				self.showMessages()
				stdscr.addstr(self.queueSize,0,"---------------")
				stdscr.addstr(self.queueSize+1,0,"Input message: ")
				message = stdscr.getstr()
				self.client.sendMessage(message)
			
			# Client is not logged in, ask for login
			else:
				stdscr.clear()
				stdscr.addstr(self.queueSize,0,"---------------")
				stdscr.addstr(self.queueSize+1,0,"Input username: ")
				nick = stdscr.getstr()
				
				# Try to login
				self.client.login(nick)
				self.stdscr.clear()
				self.stdscr.refresh()
				time.sleep(self.loginDelay)
				
		stdscr.refresh()

	
	def clearMessages(self):
		self.messageQueue = []
		
	def addMessage(self, message):
		with self.queueLock:
			if len(self.messageQueue) == self.queueSize:
				self.messageQueue.pop(0)
			self.messageQueue.append(message)
		self.showMessages()
	
	def showMessages(self):
		y, x = self.stdscr.getyx()
		for i in xrange(0,len(self.messageQueue)):
			self.stdscr.move(i,0)
			self.stdscr.clrtoeol()
			self.stdscr.addstr(i,0,self.messageQueue[i])
		self.stdscr.move(y,x)
		self.stdscr.refresh()
	
		
if __name__ == "__main__":
	chatInterface = ChatInterface()