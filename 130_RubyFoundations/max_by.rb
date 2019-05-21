require 'pry'

def max_by(collection)
  placeholder = collection[0]
  value = 0
  collection.each do |x|
    binding.pry
    placeholder = x if yield(x) > value
    value = yield(x) if yield(x) > value
  end
  placeholder
end



# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 }  == nil