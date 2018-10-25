loop do
  break if number.include?(0..10)
  number = rand(100)
  puts number
end