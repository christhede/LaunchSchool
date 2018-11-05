NEG_DIGITS = {
  '0' => 0, '1' => -1, '2' => -2, '3' => -3, '4' => -4, '5' => -5,
  '6' => -6, '7' => -7, '8' => -8, '9' => -9
}.freeze

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9
}.freeze

def string_to_signed_integer(string)
  value = 0
  if string.start_with?('-')
	   digits = string.chars[1..-1].map { |x| NEG_DIGITS[x] }
	   digits.each { |digit| value = 10 * value + digit }
  elsif string.start_with?('+')
	   digits = string.chars[1..-1].map { |x| DIGITS[x] }
	   digits.each { |digit| value = 10 * value + digit }
  else
	   digits = string.chars.map { |x| DIGITS[x] }
	   digits.each { |digit| value = 10 * value + digit }
  end
puts value
end

string_to_signed_integer('4321')
string_to_signed_integer('-570')
string_to_signed_integer('+100')
