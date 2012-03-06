require 'curses'
include Curses

#Curses.curs_set(0)   #turn off cursor visibility
Curses.curs_set(2)	#BOLD CURSOR

Curses.init_screen
Curses.start_color
# Determines the colors in the 'attron' below
Curses.init_pair(COLOR_BLUE,COLOR_BLUE,COLOR_BLACK) 
Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_BLACK)
Curses.init_pair(COLOR_WHITE,COLOR_RED,COLOR_WHITE)

loop do
  Curses.clear  
  Curses.setpos(1+rand * 10, 1+ rand * 10)
  
  Curses.attron(color_pair(COLOR_BLUE)|A_NORMAL){
	Curses.addstr("#{Curses.can_change_color?()}");  
  }
  Curses.attron(color_pair(COLOR_WHITE)|A_NORMAL){
	Curses.addch("\@")
  }
  
  Curses.refresh
  sleep 1
end