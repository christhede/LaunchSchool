

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]         

# create a new array for fiddling with
# use pop and shift to 

# first, create new array
# second, pop last element off array, 
# third, shift first element off array, 
# third, place popped array onto front of array
# fourth, sh

def rotate_array(array)
  new_array = array
  first = new_array.shift
  last = new_array.pop
  new_array << first
  new_array.unshift(last)

  p new_array
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']