# series.rb


# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# input: a string of digits

# output: all the possible consecutive number series of lenght n in that strings

# 1. create a method called 'slices' 
# 2. Convert the string digits to integers with digits method the digits up into their consecitve lengths using the slice method and iterating over the original digits with map to returns new array of the sliced digits.
# 3. with each iteration, move the n digit forward with creating a counter += 1 along with the tail end counter += 1, until you reach the end of the array

class Series
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def to_s
		@string
	end

	def slices(n)

		@string.size.times do |x|
			puts @string.slice(x..n)
			x += 1
			n += 1
			break if n == @string
		end
	end
end

series = Series.new("123458")
series.slices(4)