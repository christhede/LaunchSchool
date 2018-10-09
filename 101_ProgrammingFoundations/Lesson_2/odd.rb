def is_odd?(number)
  number.remainder(2) == 1
end

puts is_odd?(5)
puts is_odd?(2)
puts is_odd?(7)
puts is_odd?(-2)