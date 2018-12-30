# def interleave(array1, array2)
#   array3 = []

#   loop do 
#     array3 << array1.shift
#     array3 << array2.shift
#     break if array2.empty?
#   end
#   array3
# end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']