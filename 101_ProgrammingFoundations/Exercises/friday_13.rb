# first, iterate through each month of the specified year, 
# to see if the 13th of that month is a friday with #friday? method
# if true, add += 1 to a counter
# after the 12th month, return counter

require 'date'

def friday_the_13(year)
  month = 1
  counter = 0

  loop do 
    counter += 1 if Date.new(year, month, 13).friday?
    month += 1
    break counter if month == 13
  end
end

p friday_the_13(2015)
p friday_the_13(1986)