# array of words
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# a blank array
array2 = []
# pushing values from array 1 to array 2
array1.each { |value| array2 << value }

array1.each { |value| value.upcase! if value.start_with?('C', 'S') } # => Moe CURLY SHEMP harp CHICO Groucho Zeppo
# 
puts array2