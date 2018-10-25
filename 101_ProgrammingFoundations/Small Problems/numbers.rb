puts "Please write word or multiple words:"
words = gets.chomp

puts "There are #{words.delete(" ").length} characters in '#{words}'"

