def select(array)
  counter = 0
  returned_array = []
  
  while counter < array.size
    returned_array << array[counter] if yield(array[counter])
    counter += 1
  end
  
  p returned_array
end
    

array = [1, 2, 3, 4, 5]

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true