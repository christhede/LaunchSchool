def prompt(input)
  puts ">> #{input}"
end

prompt "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
letter = gets.chomp

if letter == "s"
  sum = (1..integer).reduce(:+)
  prompt "The sum of the integers between 1 and #{integer} is #{sum}"
elsif
  letter == "p"
  product = (1..integer).reduce(1, :*)
  prompt "The sum of the integers between 1 and #{integer} is #{product}"
else
  "That is not a valid answer"
end