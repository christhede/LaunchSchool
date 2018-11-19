<<<<<<< HEAD
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |inner_array|
  incremented_hash = {}
  inner_array.each do |key, value|
   incremented_hash[key] = value + 1
  end
  puts incremented_hash
end
=======
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  p sub_array.sort.reverse
end
>>>>>>> a495bb4e7363c19f1c59c2041dde89c56857c079
