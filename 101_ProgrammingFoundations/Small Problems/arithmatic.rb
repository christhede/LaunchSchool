puts "==> Enter the first number:"
num_one = gets.chomp.to_f

puts "==> Enter the second number:"
num_two = gets.chomp.to_f


addition = num_one + num_two
subraction = num_one - num_two
product = num_one * num_two
quotient = num_one / num_two
remainder = num_one % num_two
power = num_one * num_two

puts "==> #{num_one} + #{num_two} = #{addition}"
puts "==> #{num_one} - #{num_two} = #{subraction}"
puts "==> #{num_one} * #{num_two} = #{product}"
puts "==> #{num_one} / #{num_two} = #{quotient}"
puts "==> #{num_one} ** #{num_two} = #{power}"




