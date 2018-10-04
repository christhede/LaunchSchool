# ask the user for two numbers
# ask the user for an operation
# perform the operatuon on the two numbers
# output the result 

puts "Welcome to Calculator!"

puts "What;s the first number?"
num1 = gets.chomp.to_i

puts "What is the second number?"
num2 = gets.chomp.to_i

puts "What operation should we perfom? 1) add 2) Subtract 3) Multiply 4) Divide"
operator = gets.chomp 

if operator == "1"
  result = num1 + num2
elsif operator == '2'
  result = num1 - num2
elsif operator == '3'
  result = num1 * num2
elsif operator == '4'
  result = num1.to_f / num2.to_f
end

puts "the result is #{result}"



