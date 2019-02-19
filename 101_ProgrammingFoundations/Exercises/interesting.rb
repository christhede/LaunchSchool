# input: integer n 
# n is how many squares along each diagonaledge
# n is also how many numbers away from center 
# if n == 3, n is 3 from center
# polygon is always odd
# first, find the center, which is n * 2 - 1 / 2
# then add the squares above and below which are 2 less than middle, 
# repeat this process until 1 is left 
# return full number
# output: numbers of squares in polygon n

# use a looping mechanism, like up to, or (n*2-1).downto(1) do |x|
# each pass, subtract 2 from x and add that to variable num
# if next x.even?
# else num += n*2 

require 'pry'

def poly(n)
  num = 0

  (n*2-1).downto(1) do |x|
    if x == n*2-1
      num += x
    elsif x.even?
      next
    else 
      num += x*2
    end
  end
  num
end

p poly(22) # == 25