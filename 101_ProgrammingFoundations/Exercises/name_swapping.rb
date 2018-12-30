def sequence(num1, num2)
  arr = []
  index = 1
  loop do
    arr << (num2 * index)
    index += 1
    break if (index - 1) == num1
  end
  p arr
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []