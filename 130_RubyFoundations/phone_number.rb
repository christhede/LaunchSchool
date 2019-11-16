# create a phone number checker
# if number is less than 10 digits, it is a bad number
# if it is 11 digits, and first is 1, then it is assumed to be a good number
# if number is 11 and not 1, bad number
# if number is more than 11, bad number
# require 'pry'

class PhoneNumber
  BAD = '0000000000'

  def initialize(number)
    @num = number
  end

  def number
    return BAD if valid_num?

    @num = @num.scan(/\d/).join
    count = @num.chars.count

    if count > 11 || count < 10
      BAD
    elsif count == 11
      eleven_checker
    elsif count == 10
      @num
    else
      BAD
    end
  end

  def eleven_checker
    if @num[0] == '1'
      return_10_digits
    else
      BAD
    end
  end

  def valid_num?
    @num.count("a-zA-Z") > 0
  end

  def return_10_digits
    @num[0] = ''
    @num
  end

  def area_code
    number
    @num[0..2]
  end

  def to_s
    number
    '(' + @num[0..2] + ')' + ' ' + @num[3..5] + '-' + @num[6..9]
  end
end

# # num = PhoneNumber.new('123-abc-1234')
# # p num.number
# bill = PhoneNumber.new('19876543210')
# p bill.number
