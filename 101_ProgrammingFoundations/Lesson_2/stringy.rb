def stringy(number)
  string = ""
  loop do
    if number == 0
      break
    elsif 
      string.empty?
      string << "1"
    elsif 
      string.end_with?("0")
      string << "1"
    elsif 
      string.end_with?("1")
      string << "0"
    end
  number -= 1
  end
string
end

puts stringy(6) == "101010"
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
