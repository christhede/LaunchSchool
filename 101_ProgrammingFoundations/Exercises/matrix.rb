# matrix = [
#   [1, 2, 3],
#   [4, 5, 6],
#   [7, 8, 9]
# ]

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]



# matrix = [
#   [1, 4, 7],
#   [2, 5, 8],
#   [3, 6, 9]
# ]

# create a new array of arrays
# maually move each item to the right spot
# use 


# def transpose(array)
#   new_arr = []
#   new_arr << [array[0][0], array[1][0], array[2][0]]
#   new_arr << [array[0][1], array[1][1], array[2][1]]
#   new_arr << [array[0][2], array[1][2], array[2][2]]
#   p new_arr
# end
require 'pry'

def transpose(matrix)
  new_arr = []
  0.upto(matrix[0].size-1) do |column_index| 
    # binding.pry
    new_row = (0..(matrix[0].size-1)).map do |row_index|  
                next if row_index >= matrix.size
                # binding.pry
                matrix[row_index][column_index]
              end
              # binding.pry
    new_row.compact!
    new_arr << new_row
  end
  p new_arr
end

# [1, 2, 3, 4] 
# == 
# [1],
# [2],
# [3],
# [4]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  # [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# transpose([[1]]) == [[1]]


