def rotate_array(array)
  new_array = []
  new_array << array.shift
  puts new_array
end

def rotate_integer(integer)
  array = integer.to_s.chars
  array << array.shift
  array.join.to_i
end

def rotate_string(string)
  array = string.chars
  array << array.shift
  array.join
end

# string = 'super'
# p rotate_string(string)
# p string == 'super'



# rotate_integer(543451)
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4] 