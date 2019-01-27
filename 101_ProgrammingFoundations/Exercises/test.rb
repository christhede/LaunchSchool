require 'pry'

def add_name(arr, name)
  arr << [name]
  binding.pry
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect   

