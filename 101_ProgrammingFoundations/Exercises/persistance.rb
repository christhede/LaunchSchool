

# method takes arguement
# split number into single digits with #num.digits.reverse
# multiply numbers together using inject(:*)
# if new_num.size > 1 then repeat process
# else return num 
# returns a single digit number

def persistence(number)
  counter = 0
  num = number.digits.reverse
  loop do
    break if num.size == 1
    num = num.inject(:*).digits
    counter += 1
  end

  counter
end

p persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

p persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

p persistence(4) # returns 0, because 4 is already a one-digit number