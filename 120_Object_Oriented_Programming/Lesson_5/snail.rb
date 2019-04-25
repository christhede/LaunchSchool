

# snail(array) #=> [1,2,3,6,9,8,7,4,5]

# input: a nested array of numbers
# first, create a new array titles snailed_array to hold values
# we need an index to keep track of where the selecte number is, and one for what array we are in
# the snail will run accross the top first, so push all numbers from 1-3 into snailed_array
# then, depending on how many nested arrays there are, run down the right hand side of the square,
# pushing all the rightmost numbers of the array to snail_array. 
# Keep an variable named right_side = -1 to start, and add 1 every time you move down the right side.
# Once you get to the last array, start from the right and push all numbers to snail_array
# 
require 'pry'

def snail(array)
  @snail_array = []
  @sliding_array = []
  0.upto(array.size-1) { |x| @sliding_array << x }
  @array_index = 0
  @val_index = 0
  @farthest_right = -1
  @farthest_left = 0

  loop do
    to_the_right(array)
    @sliding_array.delete_at(0)
    @farthest_right -= 1
    to_the_bottom(array)
    to_the_left(array)
    @sliding_array.delete_at(-1)
    @farthest_left += 1
    to_the_top(array)
    @val_index += 1
  end

  snail_array
end

def to_the_right(array)
 loop do
    return @snail_array if @snail_array.size == array.flatten.size
    @snail_array << array[@array_index][@val_index]
    break if array[@array_index][@val_index] == array[@array_index][@farthest_right]
    @val_index += 1
  end
end

def to_the_bottom(array)
  loop do
    return @snail_array if @snail_array.size == array.flatten.size
    @array_index += 1
    @snail_array << array[@array_index][@val_index]
    break if @array_index == @sliding_array.last
  end
end

def to_the_left(array)
  loop do
    return @snail_array if @snail_array.size == array.flatten.size
    @val_index -= 1
    @snail_array << array[@array_index][@val_index]
    break if array[@array_index][@val_index] == array[@array_index][@farthest_left]
  end
end

def to_the_top(array)
  loop do
    return @snail_array if @snail_array.size == array.flatten.size
    @array_index -= 1
    @snail_array << array[@array_index][@val_index]
    break if @array_index == @sliding_array.first
  end
end

array = [[1,2,3,4,5],
         [6,7,8,9,10],
         [11,12,13,14,15],
         [16,17,18,19,20],
         [21,22,23,24,25]]

array = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
[36, 37, 38, 39, 40, 41, 42, 43, 44, 11],
[35, 64, 65, 66, 67, 68, 69, 70, 45, 12], 
[34, 63, 84, 85, 86, 87, 88, 71, 46, 13],
[33, 62, 83, 96, 97, 98, 89, 72, 47, 14],
[32, 61, 82, 95, 100, 99, 90, 73, 48, 15],
[31, 60, 81, 94, 93, 92, 91, 74, 49, 16],
[30, 59, 80, 79, 78, 77, 76, 75, 50, 17], 
[29, 58, 57, 56, 55, 54, 53, 52, 51, 18], 
[28, 27, 26, 25, 24, 23, 22, 21, 20, 19]]

p snail(array) == (1..100).to_a



