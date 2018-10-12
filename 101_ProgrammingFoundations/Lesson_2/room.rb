puts "What is the length of the room in meters?"
length = gets.chomp.to_i

puts "What is the width of the room in feet?"
width = gets.chomp.to_i

square_meters = length * width

puts "The width of the room is #{square_meters} square meters (#{square_meters * 3.28084} square feet)"