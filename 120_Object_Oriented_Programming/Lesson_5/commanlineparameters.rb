# input: 
# an array of strings or nested arrays

# first, we have to split the array, and iterater through array, finding out if each array contains for than one string. 

# iterate through array with .map method
# if array.size > 1, 
	# if 1st array string.size > 1
	# return '--' + array.join
	# else 
	# return '-' + array.join
	# end

# if string 

#output:
# a string

def args_to_string(array)
	array.map {|element| element.class == Array && element.size > 1 ? element[0].size > 1 ? '--' + element.join(' ') : '-' + element.join(' ') : element }.join(' ')
end

def commandline(array)
	array.map do |element|
		if element.class == Array && element.size > 1
			element[0].size > 1 ? '--' + element.join(' ') : '-' + element.join(' ')
		else
			element
		end
	end.join(' ')
end


p commandline([["foo", "bar"], "baz"])
p commandline([["foo", "bar"], ["baz", "qux"]]) == "--foo bar --baz qux"