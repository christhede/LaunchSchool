def merge(arr1, arr2)
  arr = arr1 << arr2
  arr.flatten.uniq
end


merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]