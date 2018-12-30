ASTX = '*'
SPACE = ' '

def triangle(num)
  array = []
  array.fill(SPACE, 0, num)
  
  loop do
    array.shift
    array << ASTX
    p array.to_s.gsub(/[\[\]'\",]/, '')
    break if array.count(ASTX) == num
  end
end

puts triangle(12)