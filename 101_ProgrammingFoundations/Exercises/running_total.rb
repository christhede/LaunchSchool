def running_total(number)
  total_array = []
  array = []

    number.map do |x| 
    array << x
    total_array << array.sum
  end
  total_array
end

running_total([2, 5, 13])
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []