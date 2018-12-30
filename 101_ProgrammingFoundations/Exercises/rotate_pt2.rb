require 'pry'

def rotate_rightmost_digits(integer, num)
  array = integer.to_s.chars
  array << array[-num]
  array.delete_at(-num-1)
  array.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917