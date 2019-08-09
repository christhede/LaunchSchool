# input: a number

# first find the divisors of the num. numbers that divide into the number evenly except the number itself. 
# add all of the divisors up and compare it to the original num
# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number

# output: a word 


class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1

    case
    when divisors(num) == num then 'perfect'
    when divisors(num) > num  then 'abundant'
    when divisors(num) < num  then 'deficient'
    end
  end

  def self.divisors(num)
    1.upto(num-1).select { |x| num % x == 0 }.reduce(:+)
  end
end

# # p PerfectNumber.divisors(6)
# p PerfectNumber.classify(28)