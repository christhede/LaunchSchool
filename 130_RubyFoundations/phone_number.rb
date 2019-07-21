# input: a series of digits
# create a valid_number? method to check if the number is under 10 digits, or over 11

# output: a ten digit number without spaces
require 'pry'

class PhoneNumber
  def initialize(number)
    @number = number.scan(/\b[\d]+\b/).join 
  end

  def number
    if valid_number?
      if @number.size == 11
        @number = @number[1..10]
      else
        @number
      end
    else
      '0000000000'
    end
  end

  def valid_number?
    @number.size == 10 || @number.size == 11 && @number[0] == '1'
  end

  def area_code
    @number[0..2]
  end

  def to_s
    number
    "(#{area_code}) #{@number[3..5]}-#{@number[6..9]}"
  end
end

# p PhoneNumber.new('(123) 456-7890').number
p PhoneNumber.new('19876543210').number