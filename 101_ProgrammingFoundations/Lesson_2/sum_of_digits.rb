def sum(number)
  a = number.to_s.chars.map(&:to_i)
  a.sum
end

puts sum(23)
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45