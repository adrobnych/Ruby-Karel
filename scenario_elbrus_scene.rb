$LOAD_PATH << File.dirname(__FILE__)
require 'board'
require 'karel'
require 'beeper'
require 'curses'
include Curses

# newspaper

def run
  board = Board.new
  
  6.times do
    |t|
    board.add_wall 3 + t*3, board.height, :to_north, 3 + t*3
  
  end
  
  karel = Karel.new board, 1, board.height, :to_east
  board.add_karel karel
  board.draw
  
  yield karel
  
  getch
  #test if mission accomplished
end


