"reverse an array without using the built-in reverse method"

arr = [5, 4, 3, 2, 1]

def reverse(arr)
  p arr.sort_by {|a, b| b <=> a}
end

reverse(arr)
