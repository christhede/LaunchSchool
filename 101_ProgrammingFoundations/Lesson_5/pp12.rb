arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr.map do |key, value|
  new_hsh = {}
  new_hsh[key] = value
  puts new_hsh
end