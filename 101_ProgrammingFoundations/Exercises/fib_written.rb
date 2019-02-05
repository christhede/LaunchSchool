# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# (n - 1) + (n - 2)
require 'pry'

def fib_written(num)
  arr = []
  number = 1
  first = (number - 1)
  second = (number - 2)

  1.upto(num) do
    if number <= 2
      arr << number
      number += 1
    else
      arr << first + second
      first = second
      second = first + second
    end
    binding.pry
  end

  arr
end

def fib_written(num)

p fib_written(8)

