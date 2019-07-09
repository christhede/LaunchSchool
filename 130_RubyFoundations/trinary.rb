# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302

# input: a trinary number string
# output: a decimal equivalent

class Trinary
  INVALID_TRINARY= /\D|[4-9]/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    @trinary =~ INVALID_TRINARY ? 0 : calculate
  end

  def calculate
    decimal = 0
    digits = @trinary.to_i.digits
    digits.each_with_index.map {|obj, idx| obj * (3**idx)}.inject(:+)
  end
end

p Trinary.new('1122000120').to_decimal
# p Trinary.new('abcd').to_decimal
# p Trinary.new('123a').to_decimal