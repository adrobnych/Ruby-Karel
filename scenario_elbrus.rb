$LOAD_PATH << File.dirname(__FILE__)
require 'scenario_elbrus_scene'


run do
  |karel|
   
  6.times do
    karel.move
    karel.turn_left

    while karel.look(:to_east) == WALL_CELL do
      karel.move
    end

    3.times do
      karel.turn_left
    end

    karel.move
    karel.move

    3.times do
      karel.turn_left
    end

    karel.move
  
    until karel.look(:to_south) == WALL_CELL do
      karel.move
    end

    karel.turn_left
  
  end  
end


