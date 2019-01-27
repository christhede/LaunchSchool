<<<<<<< HEAD
require 'pry'

def add_name(arr, name)
  arr << [name]
  binding.pry
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect   
=======
arr = [1, 2, 3, 4, 5, 6]
counter = 1
new_str = ''

arr.map do |_|
  new_str << arr[counter]
  counter += 2
end
>>>>>>> d47381683f8f543660c9e4c40b6f4cdaa76fed63

