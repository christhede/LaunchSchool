# input: a number
# output: the sum of all the multiples of that number, not including the given number

# create an array holding all of the numbers from 2..n-1
# iterate over that array with map, to reveal a new array
# if x is not a multiple of n, delete from array
# once iteration is finished, add all of those numbers together with inject(:+)

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def self.to(upto)
    SumOfMultiples.new.to(upto)
  end

  def to(n)
    list = (0..n-1).to_a
    @multiples.map { |x| list.select { |i| i % x == 0 } }.flatten.uniq.inject(:+)
  end
end

p SumOfMultiples.new(4, 6).to(15)
