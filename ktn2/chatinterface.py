import curses
from curses import wrapper
from client import Client
from threading import Lock
import time
import sys

class ChatInterface:

	def __init__(self):
		#HOST = '78.91.38.192'
		HOST = '78.91.10.63'
		#HOST = 'localhost'
		PORT = 9999

		# Initialiser klienten
		self.client = Client()
		self.client.setListener(self)
		# Start klienten
		
		self.client.start(HOST, PORT)
		self.loginDelay = 3
		
		self.queueSize = 20
		self.messageQueue = []
		self.queueLock = Lock()
		self.stdscr = curses.initscr()
		

		curses.start_color()
		curses.init_pair(1, curses.COLOR_CYAN, curses.COLOR_BLACK)
		curses.init_pair(2, curses.COLOR_RED, curses.COLOR_BLACK)
		curses.init_pair(3, curses.COLOR_GREEN, curses.COLOR_BLACK)
		self.isRunning = True
		
		
		
		wrapper(self.main)
		
	def shutDown(self):
	        self.isRunning = False
	        curses.nocbreak()
	        self.stdscr.keypad(0)
	        curses.echo()
		
	def main(self, stdscr):
		# Clear screen
		self.stdscr = stdscr
		stdscr.clear()
		curses.echo()
		
		while self.isRunning:
			if self.client.isLoggedIn():
				
				stdscr.clear()
				with self.queueLock:
					self.showMessages()
					stdscr.addstr(self.queueSize,0,"---------------")
					stdscr.addstr(self.queueSize+1,0,"Input message: ")
				if(not self.isRunning): 
				        break
				message = stdscr.getstr()
				self.client.checkMessage(message)
				stdscr.refresh()
			
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
		        lengde = len(self.messageQueue[i])
			self.stdscr.move(i,0)
			self.stdscr.clrtoeol()
			if("Logged in as " in self.messageQueue[i][0:14]):
			        self.stdscr.addstr(i,0,self.messageQueue[i], curses.color_pair(3))
			        continue
			self.stdscr.addstr(i,0,self.messageQueue[i][0:16], curses.color_pair(2))
			
			
			
			if("logged in." in self.messageQueue[i]):
			         self.stdscr.addstr(i,16,self.messageQueue[i][16:lengde], curses.color_pair(1))
		        else:
		              self.stdscr.addstr(i,16,self.messageQueue[i][16:lengde])  
			
		self.stdscr.move(y,x)
		self.stdscr.refresh()
	
		
if __name__ == "__main__":
	chatInterface = ChatInterface()