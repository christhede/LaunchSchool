require 'benchmark'
require 'bigdecimal/math'

# calculate pi to 10k digits
puts Benchmark.measure { BigMath.PI(10_000) }

def divisors(element)
  divisors = []

  1.upto(element) do |n|
    divisors << n if (element % n).zero?
  end

  divisors
end

def summing_divisors(array)
  array.map { |x| x * x }.sum
end

def digit_root(number)
  number.digits.reverse.sum while digit_sum > 9
end

def list_squared(num1, num2)
  array_of_squares = []

  num1.upto(num2) do |x|
    if (Math.sqrt(summing_divisors(divisors(x))) % 1).zero?
      array_of_squares << [x, summing_divisors(divisors(x))]
    end
  end

  array_of_squares
end

p list_squared(1, 500)
