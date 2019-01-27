arr = [1, 2, 3, 4, 5, 6]
counter = 1
new_str = ''

arr.map do |_|
  new_str << arr[counter]
  counter += 2
end

