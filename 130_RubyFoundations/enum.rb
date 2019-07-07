# fact = Enumerator.new do |yielder|
# 	num = 0
# 	loop do
# 		arr = []

# 		if num == 0 || num == 1
# 			yielder << 1
# 		else
# 			num.downto(1) {|n| arr << n }
# 			yielder << arr.inject(:*)
# 			p arr
# 		end

# 		num += 1
# 	end
# end

# p fact.take(7)

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# 7.times { puts factorial.next }

# # factorial.rewind

# factorial.each_with_index do |number, index|
#   puts number
#   break if index == 6
# end

factorial.each_with_index do |num, index|
	num
	break if index == 6
end
