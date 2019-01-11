require 'pry'

def bubble_sort!(arr)
  loop do 
    index0, index1 = 0, 1
    swapped = false

    loop do
      if arr[index0] > arr[index1]
        arr[index0], arr[index1] = arr[index1], arr[index0]
        swapped = true
      end

      index0 += 1
      index1 += 1

      break if index1 >= arr.size
    end

    break if swapped == false
  end

  p arr
end

# array = [5, 3]
# bubble_sort!(array)
# array #== [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array #== [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
