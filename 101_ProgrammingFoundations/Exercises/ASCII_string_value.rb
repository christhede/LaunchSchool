def ascii_value(string)
  num = 0
  string.chars.each do |x| 
    num += x.ord
  end
  puts num
end

ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0