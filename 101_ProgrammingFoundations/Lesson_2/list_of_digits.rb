def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

puts digit_list(67432) == [6, 7, 4, 3, 2]
puts digit_list(67432)