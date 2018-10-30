def short_long_short(string_1, string_2)
  if string_1.size < string_2.size
    puts "#{string_1}#{string_2}#{string_1}"
  else
    puts "#{string_2}#{string_1}#{string_2}"
  end
end



short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"