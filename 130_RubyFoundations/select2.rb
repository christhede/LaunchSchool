array = [1, 2, 3, 4, 5]

def select(args)
	counter = 0
	new_arr = []
	while counter < args.size
		new_arr << args[counter] if yield(args[counter])
		counter += 1
	end

	new_arr
end



p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 } 