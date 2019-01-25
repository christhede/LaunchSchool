# Write a method that takes one argument, 
# a positive integer, and returns a list of the digits in the number.

# creat a method definition with one perameter, 'number'
# could use the #digits method with a reverse
# OR use to_s, chars to create and array of seperated numbers
# 

# def digit_list(number)
#   number.to_s.chars.map { |x| x.to_i }
# end

def digit_list(number)
  number.digits.reverse
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]  