def oddities(array)
  new_array = []
  counter = 0

  while counter != array.size

    current_number = array[counter]
    new_array << current_number if counter.even?

    counter += 1
  end
  new_array
end



puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

p oddities([2, 3, 4, 5, 6])