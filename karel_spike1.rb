Thread.current.priority = 20

screen = []
600.times do
	screen << "\n"
end
screen << "a                                     a\n"
20.times do |n|
	screen << "\n"
end
screen << "a                                     a\n"


puts screen

screen[-5] = "\n"
line = "             X\n"

15.times do
	line = " " + line
    screen[-5] = line
	puts screen
	sleep 0.5
end

gets

screen = []
30.times do
	screen << "\n"
end
puts screen

puts "the end"
