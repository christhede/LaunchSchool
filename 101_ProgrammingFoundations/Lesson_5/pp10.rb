arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |num|
  new_array = []
  num.select { |x| new_array << x if x % 3 == 0}
  p new_array
end

