def list_squared(num1, num2)
  array_of_squares = []

  num1.upto(num2) do |x|

    divisors(x)

    if square?(summing_divisors(divisors(x)))
      array_of_squares << [x, summing_divisors(divisors(x))]
    end
  end

  array_of_squares
end

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

def square?(number)
  (Math.sqrt(number) % 1).zero?
end

def digit_root(number)
  digit_sum = number.digits.reverse.sum
  digit_sum.digits.reverse.sum while digit_sum > 9
end

p list_squared(1, 250)
