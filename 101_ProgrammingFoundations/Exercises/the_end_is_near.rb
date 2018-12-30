def sum_of_sums(array)
  index = 0
  new_array = []
  loop do
    new_array << array[0..index].inject(:+)
    index += 1
    break if index == array.count
  end
  p new_array.inject(:+)
end



sum_of_sums([3, 5, 2]) # == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3])# == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) # == 4
sum_of_sums([1, 2, 3, 4, 5]) # == 35