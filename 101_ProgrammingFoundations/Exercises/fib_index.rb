# "select the element out of the array if its index is a fibonacci number",

# def fib_index(array)
# end


#first, find fibonacci numbers for the lenght of array
  # use n = n + 1
require 'pry'

def fibonacci(number)
  if number < 2 
    number
  else 
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def fib_array(array) 
  arr = []
  
  1.upto(array.size) do |x|
    arr << fibonacci(x)
  end

  arr
end

def fib_index(array)
  new_arr = []

  fib_array(array).each do |x|
    if array[x] == nil 
      x
    else
      new_arr << array[x]
    # binding.pry
    end
  end
  new_arr
end

p fib_index([765, 39, 22, 92, 49, 86, 45, 100, 12, 44, 45, 46, 37, 4534, 5453])