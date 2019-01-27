# Test.assert_equals(row_sum_odd_numbers(1), 1)
# Test.assert_equals(row_sum_odd_numbers(2), 8)
# Test.assert_equals(row_sum_odd_numbers(13), 2197)
# Test.assert_equals(row_sum_odd_numbers(19), 6859)
# Test.assert_equals(row_sum_odd_numbers(41), 68921)

#           1
#           3     5
#        7     9    11
#    13    15    17    19
# 21    23    25    27    29
# ...

# create a loop of odd numbers, where you add one more number to the end of the odd number loop 
# create a hash to hold values of the odd numbers where the key is the 'index' value.
# the hash key is also the number of integers that are in the hash
# hsh[1] = 1
# hsh[2] = {3, 5} == 8
# hsh[3] = {7, 9, 11} == 27
# initilize hash with a value of 0

# def row_sum_odd_numbers(row)
#   hsh = Hash.new(0)
#   0.upto(row) do |num|
#     puts hsh[num] = 
#   end
# end

def row_sum_odd_numbers(row)
  hsh = Hash.new(0)
  number = -1
  arr = []

  1.upto(row) do |x|
    1.upto(x) do
      arr << number += 2
    end

    hsh[x] = arr.pop(x)
  end
  
  hsh[row].inject(:+)
end

row_sum_odd_numbers(13)
