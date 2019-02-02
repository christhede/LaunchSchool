# find primes between two numbers

# 1. iterate through the number num1..num2
# 2. select numbers that are divisible by 1 with a remainder of 0, and itself with a remainder of 0
# 3. 

# iterate through numbers, checking to see if
require 'pry'

def prime(num1, num2)
  original_array = (num1..num2).to_a

  (num1..num2).select do |x| 
    original_array.delete(x) if x == 1

    (2..x-1).each do |n|
      if x % n == 0
        original_array.delete(x)
      end
    end
  end

  original_array
end

p prime(1, 100) == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
