arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_array|
  new_array = []
  sub_array.select do |x| 
    new_array << x if x % 3 == 0
  end
  p new_array
end

