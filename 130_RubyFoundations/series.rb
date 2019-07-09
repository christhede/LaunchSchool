# series.rb


# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# input: a string of digits

# output: all the possible consecutive number series of lenght n in that strings

# 1. create a method called 'slices' 
# 2. Convert the string digits to integers with digits method the digits up into their consecitve lengths using the slice method and iterating over the original digits with map to returns new array of the sliced digits.
# 3. with each iteration, move the n digit forward with creating a counter += 1 along with the tail end counter += 1, until you reach the end of the array

class Series
	def initialize(string)
		@number = string.chars.map(&:to_i)
	end

	def slices(n)
		raise ArgumentError, "Arg too large for series of numbers"  if n > @number.size

		idx1 = 0
		idx2 = n-1
		arr = []
		until idx2 == @number.size
			arr << @number.slice(idx1..idx2)
			idx1 += 1
			idx2 += 1
			break if idx2 == @number.size
		end

		arr
	end
end

series = Series.new("01234")
p series.slices(1)




