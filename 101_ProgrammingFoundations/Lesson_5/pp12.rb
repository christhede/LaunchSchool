arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

<<<<<<< HEAD
arr.map do |key, value|
  new_hsh = {}
  new_hsh[key] = value
  puts new_hsh
end
=======
arr.each do |sub_array|
 new_hsh = {}
 new_hsh[sub_array[0]] = sub_array[1]
 p new_hsh
end

>>>>>>> a495bb4e7363c19f1c59c2041dde89c56857c079
