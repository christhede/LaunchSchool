# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# n/2.ceil is a line of n stars, anything else is n/2.floor stars
# if n == 7, 7/2.floor == 3
# use a looping structure for the first 3 lines, such as 3.downto(1), to iterate and print the first 3 lines
# depending on n, first, print '*', then print n-1 * ' ' for spaces
# then once we reach the center, or n/2.ceil 
  # print out n * '*'
# use 1.upto(n/2.floor) to loop through sequence which is the reverse of above

def star(num)
  space = ' '
  (num/2).downto(1) do |x|
    if x == num/2
      puts '*' + space * (x-1) + '*' + space * (x-1) + '*' 
    else
      puts space * (num/2-x) + '*' + space * (x-1) + '*' + space * (x-1) + '*'
    end
  end
  puts '*' * num

  1.upto(num/2) do |x|
    if x == num/2
      puts '*' + space * (x-1) + '*' + space * (x-1) + '*' 
    else
      puts space * (num/2-x) + '*' + space * (x-1) + '*' + space * (x-1) + '*'
    end
  end
end

star(9)
