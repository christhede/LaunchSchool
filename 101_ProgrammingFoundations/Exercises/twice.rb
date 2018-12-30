require 'pry'

def twice(num)
  count = num.to_s.chars.count
  middle_num = (count) / 2

  if num.to_s.chars.count == 1 
    puts num * 2
  elsif num.to_s.chars[0..(middle_num - 1)] == num.to_s.chars[middle_num..-1]
    puts num
  else
    puts num * 2
  end
end


twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10