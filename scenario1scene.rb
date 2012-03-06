$LOAD_PATH << File.dirname(__FILE__)
require 'board'
require 'karel'
require 'beeper'
require 'curses'
include Curses

# newspaper

def run
  board = Board.new

  board.add_wall 5, 5, :to_east, 5
  board.add_wall 5, 5, :to_south, 5
  board.add_wall 5, 10, :to_east, 5
  board.add_wall 10, 5, :to_south, 1
  board.add_wall 10, 10, :to_north, 1
  
  board.add_beeper "newspaper", 11, 7
  karel = Karel.new board, 6, 6, :to_east
  board.add_karel karel
  board.draw
  
  yield karel
  
  getch
  #test if mission accomplished
end


