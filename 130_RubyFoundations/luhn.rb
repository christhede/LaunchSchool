# - must count from right most digit
# - double the value of every second digit
# - if the value of such digits succeeds 10, minues 9 from value
# - sum all digits
# - if the total (checksum) % 10 == 0, then it is valid

class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    # returns array of number with doubled second digits
    # take number, split into seperate numbers, double every second number and return that array with map
    @number.digits.each_with_index.map do |obj, idx|
      idx.odd? ? obj * 2 < 10 ? obj * 2 : (obj * 2)-9 : obj
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end
end





luhn = Luhn.new(873_956)
# assert_equal 22, luhn.checksum
p luhn.checksum
# p luhn.valid?

