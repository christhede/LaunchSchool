# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# sum of multiples 7, 13, and 17 up to, but not including 20.
# first, find all of the multuple of 7, up to 19.
# then, find all the multiples of 13 up to 19 
# then, find all the multiples fo 17 up to 19
# add them all together
# return that number


# class SumOfMultiples
#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def self.to(limit, multiples = [3, 5])
#     p multiples
#     p limit
#   end

#   def to(limit)
#     self.class.to(limit, @multiples)
#   end
# end

# SumOfMultiples.to(15)
# SumOfMultiples.new(7, 13, 17).to(20)

# OR

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit, multiples = [3, 5])
    p multiples
    p limit
  end

  def to(limit)
    SumOfMultiples.to(limit, @multiples)
  end
end

SumOfMultiples.to(15)
SumOfMultiples.new(7, 13, 17).to(20)