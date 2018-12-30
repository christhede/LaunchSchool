require 'pry'

def multiply_all_pairs(array1, array2)
  array3 = []

  array1.each do |num1|
    array2.each do |num2|
      array3 << num1 * num2
    end
  end
  p array3.sort
end


multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]