# the product of two numbers, equals the same forwards as it does backwards. 
# Write a program that can detect palindrome products in a given range.

class Palindromes
  attr_accessor :max_factor, :min_factor, :arr_of_factors

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @arr_of_factors = factors(max_factor, min_factor)
  end

  def factors(max, min)
    arr = []
    (min..max).each do |x|
      (min..max).each do |i|
        arr << [x, i] 
      end
    end
    arr + (min..max).to_a.map { |num| [num, num] }
  end

  def generate
    @arr_of_factors.select! { |x, i| (x * i).digits == (x * i).digits.reverse }
  end


  def largest
    @arr_of_factors.select { |x| x.inject(:*) == @arr_of_factors.last.inject(:*) }
  end

  def smallest
    @arr_of_factors.select { |x| x.inject(:*) == @arr_of_factors.first.inject(:*) }
  end

  def value
    inject(:*)
  end
end

pal = Palindromes.new(max_factor: 9)
# pal.generate
# p pal.arr_of_factors
pal.generate
largest = pal.largest
largest.value


# p pal.arr_of_factors
