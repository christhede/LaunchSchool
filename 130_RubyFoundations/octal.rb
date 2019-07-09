# # octal to decimal conversion

# # input: octal string
# # output: decimal conversion output

# # # convert octal numbers to decimal numbers.

# first, we have to work backwords from 
# octal 17 == decimal 15

# 17 #octal 
# 1*8^1 + 7*8^0


# example: 233
# first, remove the first number from the octal number and add it to the running decimal count.
# decimal = 2
# then, if there are still numbers left, multiply the decimal count by 8
# decimal = 16
# then add the next number to the count.
# decimal = 19
# then, if there are still numbers left, multiply that number by 8
# decimal = 152
# then add remaining number to decimal count.
# decimal = 155

# 130
# dec = 1
# dec = 8
# dec = 11
# dec == 88
# dec 

# require 'pry'

class Octal
  def initialize(number)
    @number = number.to_i.digits.reverse
  end

  def invalid?
    @number.any? { |x| ('a'..'z').cover?(x) || x == 9 || x == 8 }
  end

  def to_decimal
    return 0 if invalid?
    decimal_count = 0
    until @number.size == 0
      decimal_count += @number.shift
      decimal_count *= 8 if @number.size >= 1
    end
    decimal_count
  end
end

p Octal.new('9').to_decimal
p Octal.new('8').to_decimal
p Octal.new('abc12').to_decimal
p Octal.new('130').to_decimal
p Octal.new('1234567').to_decimal

# p oct.to_decimal
# p oct.is_valid?



