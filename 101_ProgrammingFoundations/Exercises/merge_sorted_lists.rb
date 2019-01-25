# Write a method that takes two sorted Arrays as arguments, 
# and returns a new Array that contains all elements from both 
# arguments in sorted order.

# You may not provide any solution that requires you to 
# sort the result array. You must build the result array one 
# element at a time in the proper order.

# Your solution should not mutate the input arrays.

# Examples:

require 'pry'

def merge(array1, array2)
  new_array = []
  index = 0

  loop do
    break if new_array.size == (array1.size + array2.size)

    case
    when array1.empty? then new_array << array2
    when array2.empty? then new_array << array1
    when array1[index] <= array2[index] then new_array << array1[index]
    else new_array << array2[index]
    end
    # binding.pry

    index += 1
  end

  p new_array.flatten
end




# merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) # == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) # == [1, 4, 5]
merge([1, 4, 5], []) # == [1, 4, 5]


# method defined with two perameters
# returns a new array, with all elements of both arrays sorted

# clone both arrays as to not mutate them
# inspect first index of array1, if smaller or equal to value in index1 of array2, pop array1
# if it is larger, pop array2

