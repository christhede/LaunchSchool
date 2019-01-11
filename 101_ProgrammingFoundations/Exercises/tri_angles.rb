require 'pry'
# right: One angle of the triangle is a right angle (90 degrees)
# acute: All 3 angles of the triangle are less than 90 degrees
# obtuse: One angle is greater than 90 degrees.

def triangle(x, y, z)
  sides = [x, y, z]
  largest_side = sides.max

  # binding.pry
  case
  when sides.inject(:+) != 180, sides.include?(0)
    puts :invalid
  when sides.inject(:+) == 180 && sides.include?(90)
    puts :right
  when sides.inject(:+) == 180 && largest_side > 90
    puts :obtuse
  else 
    puts :acute
  end
end

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid