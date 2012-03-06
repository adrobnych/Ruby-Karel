class Karel
  attr_accessor :board, :x, :y, :direction
  
  def initialize board, x, y, direction
    
    @board = board
    @x = x
    @y = y
    @direction = direction
    @beepers = []
    
  end
  
  def move
    case @direction
    when :to_east
      if !@board.cells[@x + 1][@y].nil? and @board.cells[@x + 1][@y] == WALL_CELL
        raise "Ouch! Here is wall! Can't move!"
      end  
   
    when :to_west
      if !@board.cells[@x - 1][@y].nil? and @board.cells[@x - 1][@y] == WALL_CELL
        raise "Ouch! Here is wall! Can't move!"
      end 
   
    when :to_north
      if !@board.cells[@x][@y - 1].nil? and @board.cells[@x][@y - 1] == WALL_CELL
        raise "Ouch! Here is wall! Can't move!"
      end 

    when :to_south
      if !@board.cells[@x][@y + 1].nil? and @board.cells[@x][@y + 1] == WALL_CELL
        raise "Ouch! Here is wall! Can't move!"
      end 

    end
    
    #@board.remove_element @x, @y
    
    case @direction
    when :to_east
      
      @x = @x + 1
      #@board.put_element @x, @y, KAREL_TO_EAST
      
    when :to_west
      
      @x = @x - 1
      #@board.put_element @x, @y, KAREL_TO_WEST
      
    when :to_north
      
      @y = @y - 1
      #@board.put_element x, y, KAREL_TO_NORTH
      
    when :to_south
      
      @y = @y + 1
      #@board.put_element x, y, KAREL_TO_SOUTH
      
    end
    
    @board.draw
  
  end
  
  def turn_left
    case @direction
    when :to_east
      @direction = :to_north
      #@board.put_element @x, @y, KAREL_TO_NORTH
    when :to_south
      @direction = :to_east
      #@board.put_element @x, @y, KAREL_TO_EAST
    when :to_west
      @direction = :to_south
      #@board.put_element @x, @y, KAREL_TO_SOUTH
    when :to_north
      @direction = :to_west
      #@board.put_element @x, @y, KAREL_TO_WEST
    end
    
    @board.draw
  
  end
  
  def get_beeper
    if @board.cells[x][y] == BEEPER
      @beepers.push @board.cells[x][y]
  
      @board.remove_beeper x, y
    else
      raise RuntimeError, "No beepers here! x = #{x} y=#{y} "
    end
    
    @board.draw
  end
  
  def put_beeper
    if @beepers.empty?
      raise RuntimeError, "No beepers in pocket!"
    end
    
    beeper = @beepers.pop
    
    @board.add_beeper " ", x, y
    @board.draw
  end
  
  def pocket
    @beepers
  end
  
  def look direction
    case direction
    when :to_east
      @board.cells[x+1][y]
    when :to_south
      @board.cells[x][y+1]
    when :to_west
      @board.cells[x-1][y]
    when :to_north
      @board.cells[x][y-1]
    end
  end
  
end
