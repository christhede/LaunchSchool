require 'date'

def friday_13th(year)
  num_of_fridays = 0
  1.upto(12) do |x|
    date = Date.new(year, x, 13)
    num_of_fridays += 1 if date.friday?
  end
  puts num_of_fridays
end

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2