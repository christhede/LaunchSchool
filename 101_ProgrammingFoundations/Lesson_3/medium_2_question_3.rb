def factors(number)
  # variable assignment
  dividend = number
  # devisors is an array
  divisors = []
  while dividend > 0
    # divisors is pushed number divided by dividend (which = number)
    divisors << number / dividend if number % dividend == 0
    # dividend is repeatingly - 1 until loop ends
    dividend -= 1
    # ends when dividend equals 0
  end 
  # puts the divisors array
  divisors
end

puts factors(12)

