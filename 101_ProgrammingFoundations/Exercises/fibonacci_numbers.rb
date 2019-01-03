require 'pry'

def fib(n)
  if n <= 2
    return 1
  else
    fib(n - 1) + fib(n - 2)
  end
end

puts fib(40)
puts fib(10)
puts fib(9)
puts fib(8)
puts fib(7)
puts fib(6)
puts fib(5)
puts fib(4)
puts fib(3)