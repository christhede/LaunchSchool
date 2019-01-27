require 'pry'

def my_method(array)
  if array.empty?
    []

  elsif array.size > 1
    array.map do |value|
      value * value
      # binding.pry
    end

  else
    [7 * array.first]
  end
end

p my_method([]) # []
p my_method([3]) # [21]
p my_method([3, 4]) # [9, 16]
p my_method([5, 6, 7]) # [25, 36, 49]

# []
# [21]
# [9, 16]
# [25, 36, 49]