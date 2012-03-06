$LOAD_PATH << File.dirname(__FILE__)
require 'scenario1scene'


run do
  |karel|
  
  karel.move
  karel.move
  karel.move
  karel.turn_left
  karel.turn_left
  karel.turn_left
  karel.move
  karel.turn_left
  karel.move
  karel.move
  karel.get_beeper
  karel.turn_left
  karel.turn_left
  karel.move
  karel.move
  karel.turn_left
  karel.turn_left
  karel.turn_left
  karel.move
  karel.turn_left
  karel.move
  karel.move
  karel.put_beeper
  karel.move
  karel.turn_left
  karel.turn_left
  
end


