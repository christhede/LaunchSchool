HEX = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
  "6" => 6, "7" => 7, "8" => 8, "9" => 9, "a" => 10, "b" => 11,
  "c" => 12, "d" => 13, "e" => 14, "f" => 15
}
LOCATION = {
  0 => 16, 1 => 
}
def hexadecimal_to_integer(string)
  
  digits = string.chars.map { |x| HEX[x] }

  value = 0
  digits.each { |digit| value = 4096 * value + digit}
  else

  puts value
end
end


hexadecimal_to_integer('4D9f')
#string_to_integer('570') == 570