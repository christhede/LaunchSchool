def zip(arr1, arr2)
  new_arr = []
  counter = 0

  loop do
    new_arr << [arr1[counter], arr2[counter]]
    break if counter == arr1.size - 1
    counter += 1
  end
  p new_arr
end


zip([1, 2, 3], [4, 5, 6]) # == [[1, 4], [2, 5], [3, 6]]