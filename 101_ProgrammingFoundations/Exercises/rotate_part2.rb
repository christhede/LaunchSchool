# first, split number into seperate characters with #digits, #reverse
# then, use -n + -1 as an index value of selected element to rotate
# remove n digit from array with #delete_at passing that value to a variable
# use shovel op << to concat selected element onto end of array
# return array with #join, #to_i

def rotate_rightmost_digits(number, n)
    arr = number.digits.reverse
    e = arr.delete_at(-n)
    arr << e
    arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
