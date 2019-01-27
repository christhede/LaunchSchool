# Write a function that takes an integer as input, and returns the number of bits 
# that are equal to one in the binary representation of that number. 
# You can guarantee that input is non-negative.

# Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case

# Test.assert_equals count_bits(0), 0
# Test.assert_equals count_bits(4), 1
# Test.assert_equals count_bits(7), 3
# Test.assert_equals count_bits(9), 2
# Test.assert_equals count_bits(10), 2

# method takes integer as input, one parameter
# convert number to binary number with #.to_s(2) and convert that into characters with char
# iterate through array and return the count of how many occurances of the integer 1


def count_bits(num)
  num.to_s(2).chars.select {|x| x == '1'}.size
end

puts count_bits(1234) == 5
puts count_bits(7) == 3