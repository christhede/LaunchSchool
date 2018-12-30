# require 'pry'

# def multiply_list(array1, array2)
#   index = 0
#   array3 = [] 

#   loop do
#     # binding.pry
#     array3 << (array1[index].to_i * array2[index].to_i)
#     break if array3.count == array2.count
#     index += 1
#   end
#   p array3
# end

def multiply_list(array1, array2)
  array1.zip(array2).map {|x, y| x * y}
end


multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]