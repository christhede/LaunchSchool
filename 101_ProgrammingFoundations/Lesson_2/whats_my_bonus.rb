def calculate_bonus(number, boolean)
  if boolean == true
    return number / 2
  else 
    return 0
  end
end

def calculate_bonus(number, boolean)
  boolean ? (number / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000