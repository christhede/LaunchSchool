def average(numbers)
  a = numbers.sum / numbers.count
  a.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 96, 16, 52.342])
puts average([9, 47, 23, 95, 16, 52]) == 40