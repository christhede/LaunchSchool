# iterate through every number from 0 to n/2 
# if n == x, then true
# if it ends the iteration, then it would be false

# 144 / 2 = 72 
# (0..72).each do |x| 
# if x * x == n
#   true
# else
#   next
#   false
# end 
require 'pry'

def power_of_two?(num)
  (1..num/2).each do |x|
    return if 2*x == num
  end
end


puts power_of_two?(144) #== true
puts power_of_two?(2)
puts power_of_two?(4096)
puts power_of_two?(5)