require 'pry'

def triangle(x, y, z)
  sides = [x, y, z]
  largest_side = sides.max

  # binding.pry
  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    puts :invalid
  when x == y && y == z
    puts :equilateral
  when x == y || y == z || z == x
    puts :isosceles
  else 
    puts :scalene
  end
end



triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid