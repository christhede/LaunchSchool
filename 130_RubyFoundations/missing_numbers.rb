def missing(array)
  new_array = (array.first..array.last).to_a
  array.each {|x| new_array.delete(x) if new_array.include? x }
  new_array
end


puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

#first sort the array. 
#second find all of the numbers between the smallest, and the largest numbers.
# you can iterate through with each, adding one with the #upto methods.
# then, use the uniq method to find all of the missing numbers
