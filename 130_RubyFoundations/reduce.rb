require 'pry'

def reduce(array, acc=array.first)
  acc == array.first ? counter = 1 : counter = 0
  binding.pry
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  
  p acc
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }   # => NoMethodError: undefined method `+' for nil:NilClass
reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']