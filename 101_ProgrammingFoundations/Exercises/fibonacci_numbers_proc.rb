require 'pry'

def fibonacci_last(num)
  array = []

  0.upto(num) do |x|
    if array.count < 2
      array << x
    else 
      array << array[-1] + array[-2]
    end
  end
  p array[-1].digits[0]
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5