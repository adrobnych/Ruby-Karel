
require 'spec_helper'


describe Board do
  
  
  describe "#new" do
 
    context "with no parameters" do
        it "has default size 20x20 cells" do
            board = Board.new
            board.height.should eql 20
            board.width.should eql 20
        end
    end
    
    context "with two parameters A and B" do
        it "has size AxB cells" do
            board = Board.new 10, 15
            board.height.should eql 15
            board.width.should eql 10
        end
    end
    
  end
  
  it "has borders marked by '$' with yellow background" do
    board = Board.new

    board.cells[0][0].should eql WALL_CELL
    board.cells[board.width/2][0].should eql WALL_CELL
    board.cells[board.width+1][0].should eql WALL_CELL
    board.cells[0][board.height/2].should eql WALL_CELL
    board.cells[0][board.height+1].should eql WALL_CELL
    board.cells[board.width+1][board.height+1].should eql WALL_CELL
    board.cells[board.width+1][board.height/2].should eql WALL_CELL
    board.cells[board.width/2][board.height+1].should eql WALL_CELL
    board.cells[1][1].should eql nil
  end
  
  it "shows direction of Karel with < > ^ v chars" do
    board = Board.new
    karel = Karel.new board, board.width/2, board.height/2, :to_east
    board.add_karel karel
    
    board.draw
    
    Curses.setpos(board.height/2, board.width/2)
    Curses.inch.chr.should eql ">"
    
    
  end
  
  it "has walls marked the same way as borders" do
    board = Board.new
    board.add_wall(3, 4, :to_east, 5)
    
    board.cells[2][3].should eql nil
    board.cells[3][4].should eql WALL_CELL
    board.cells[4][4].should eql WALL_CELL
    board.cells[3+5][4].should eql WALL_CELL
    board.cells[3+6][4].should eql nil
  end
    
  
  it "has beepers marked with '*' on green background" do
    board = Board.new

    board.add_beeper "simple beeper", board.width/2, board.height/2
    
    board.cells[board.width/2][board.height/2][:character].should eql '*'
    board.cells[board.width/2][board.height/2][:bg_color].should eql 'green'
  end
  
  it "knows how to re-draw its current state" do
    board = Board.new
    
    #constuct scene
    board.add_wall 3, 4, :to_east, 4
    board.add_wall 3, 4, :to_south, 2
    
    karel = Karel.new board, board.width/2, board.height/2, :to_east
    board.add_karel karel
    
    board.add_beeper "hello", 6, 9
    
    board.draw
    #Curses.getch
    #Curses is using rotated coordinates x -> y, y -> x
    
    
    #test_border
    Curses.setpos(0,0)
    Curses.inch.chr.should eql WALL_CELL[:character]         
    
    #test empty cell
    Curses.setpos(1,1)
    Curses.inch.chr.should eql "."
    
    #test walls
    Curses.setpos(4,3)
    Curses.inch.chr.should eql WALL_CELL[:character]
    Curses.setpos(5,3)
    Curses.inch.chr.should eql WALL_CELL[:character]
    Curses.setpos(4,4)
    Curses.inch.chr.should eql WALL_CELL[:character]
    Curses.setpos(5,4)
    Curses.inch.chr.should eql "."
    Curses.setpos(4,7)
    Curses.inch.chr.should eql WALL_CELL[:character]
    Curses.setpos(4,8)
    Curses.inch.chr.should eql "."
    
    #test beepers
    Curses.setpos(9,6)
    Curses.inch.chr.should eql BEEPER[:character]
    Curses.setpos(10,6)
    Curses.inch.chr.should eql "." 
    
    #test Karol
    Curses.setpos(board.height/2, board.width/2)
    Curses.inch.chr.should eql KAREL_TO_EAST[:character]
    
    
  end
  
  it "has render all KarelExceptions to first line of Curses screen and wait until key pressed"

  it "has infrmational field at right side of window including 'mission', last message form Karel, mission_accomplished_statement "
  
end
