# a perfect number is the sum of of all factors.
# an abundant number is the sum of all factors is greater than number
# a deficient number is the sum of all factors is less than the number

# if number is less than or equal to zero, raise a runtime error

# create a variable to hold the count of num.
# count = 1
# sum = 0
# loop through iterator

# divide number by 2, make that number = new_num, add that number to sum, break if num >= 0
# loop through until 


class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    sum = 0
    (1..number-1).each { |x| sum += x if number % x == 0 }
    if sum > number
      'abundant'
    elsif sum < number
      'deficient'
    else
      'perfect'
    end
  end
end

p PerfectNumber.classify(12)