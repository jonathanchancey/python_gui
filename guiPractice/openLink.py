#!/usr/bin/env python

#import Tkinter as Tk	#Tkinter module to make GUI, uses module with "Tk"
from Tkinter import *	#import all classes from Tkinter into my namespace


root = Tk()	
#initializing Tkinter with a root widget (ordinary GUI window with title bar)



w = Label(root, text="Hello, world!")  #prints GUI text
#label widget can display text/icon/image
w.pack()
#sizes itself to fit the given text

root.mainloop()
#makes the GUI window appear and keep it open until you close the window
