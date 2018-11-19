arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

<<<<<<< HEAD
arr.map do |sub_array|
  p sub_array.sort_by do |x|
    
  end
end
=======
arr.sort_by do |sub_array|
  sub_array.select do |x|
  x.odd?
end
end
>>>>>>> a495bb4e7363c19f1c59c2041dde89c56857c079
