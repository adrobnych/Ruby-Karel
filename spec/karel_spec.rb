require 'spec_helper'
 
describe Karel do
      
  it "can't step on border or wall" do
    board = Board.new
    
    karel = Karel.new board, 3, 3, :to_south
    
    board.add_karel karel
    
    board.add_wall 2, 5, :to_east, 4
    
    board.draw
    #Curses.getch
    
    karel.move
    
    board.draw
    #Curses.getch
    
    lambda do
      karel.move
    end.should raise_error(RuntimeError, "Ouch! Here is wall! Can't move!")
    
    board.draw
    #Curses.getch
   
  end
  
  it "can turn left" do
    board = Board.new
    
    karel = Karel.new board, 3, 3, :to_south
    
    board.add_karel karel
    
    board.draw
    
    Curses.setpos(3, 3)
    Curses.inch.chr.should eql KAREL_TO_SOUTH[:character]
    
    karel.turn_left
    
    board.draw
    
    Curses.setpos(3, 3)
    Curses.inch.chr.should eql KAREL_TO_EAST[:character]
    
    #Curses.getch
  end
  
  
  it "can move forward" do
    board = Board.new
    
    karel = Karel.new board, 3, 3, :to_east
    
    board.add_karel karel
    
    board.draw
    #Curses.getch
    
    Curses.setpos(3, 3)
    Curses.inch.chr.should eql KAREL_TO_EAST[:character]
    
    karel.move
    
    board.draw
    #Curses.getch
    
    Curses.setpos(3, 4)  # x and y replaced in Curses
    Curses.inch.chr.should eql KAREL_TO_EAST[:character]
   
  end
  
  it "can get beeper from board at current position and put it to his pocket" do
    board = Board.new
    
    karel = Karel.new board, 3, 3, :to_east
    
    board.add_karel karel
    
    board.add_beeper "hello", 4, 3
    
    board.draw
    
    
    Curses.setpos(3, 4)  # x and y replaced in Curses
    
    Curses.inch.chr.should eql BEEPER[:character]
    
    karel.move
    
    board.draw
    
    
    
    karel.get_beeper
    
    karel.move
    
    board.draw
    
    
    Curses.setpos(3, 4)  # x and y replaced in Curses
    Curses.inch.chr.should eql "."
    
    karel.pocket.pop.should eql BEEPER
    
  end 
  
  it "can get beeper from his pocket and put it to the board at current position" do
    board = Board.new
    karel = Karel.new board, 3, 3, :to_east
    board.add_karel karel
    
    board.draw
    
    karel.pocket.push Beeper.new "hi", 5, 5
    
    karel.move
    karel.move
    karel.move
    
    karel.put_beeper
    
    karel.move
    karel.move
    board.draw
    
    Curses.setpos(3, 6) 
    Curses.inch.chr.should eql BEEPER[:character]
  end
  
  it "can look at neighbour cell" do
    board = Board.new
    karel = Karel.new board, 3, 3, :to_east
    board.add_karel karel
    board.add_beeper "test", 4, 3
    karel.look(:to_north).should eql nil
    karel.look(:to_east).should eql BEEPER
    
  end
  
  it "can knows limit of his pocket (for beepers)"
  
  it "can setup limit of his pocket"
  
  
end
