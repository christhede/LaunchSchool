whose_winning?(num1, num2)
  if num1 > num2
    puts "The player is winning"
  elsif num2 > num1
    puts "The computer is winning"
  else 
    puts "It's a tie"
end