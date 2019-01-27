def greeting(str)

end

# one line 1-3 we have the method definition `greeting` with one parameter `str`

greeting do |x|

end

# on line 7 we are invoking the method `greeting` and passing in a do..end block 
# with one parameter `x` as an arguement

greeting("bingo")

# invoking the method `greeting` with the string object `bingo` as an argument

a = 'bingo'

# on line 14 we are assigning the local variable `a` to the string object `bingo`

a =  "Hello"
[1, 2, 3].map { |num| a }

# on line 18, we assign the local variable `a` to the string object `"Hello"`

# on line 19, we are invoking the Array#map method on an array of integers `[1, 2, 3]`, 
# and passing in a do..end block with one parameter `num` as an arguement. The method then interates through the
# array and passes each return value of the block to a new array, which after iterating, returns the new array 
# "[Hello, Hello, Hello"]`

"#{a}"
# => String Interpolation

puts a
# outputs the string object `"Hello"` to the screen and returns nil

a << 's'
# the string object "s" is being concatenated to the end of the local variable `a` which is 
# referencing the string object 'Hello'. This is a destructive method as it returns "Hellos". 
# This could also be written as a.concat('s').

a += 's'
# we are reassigning, the local variable a, 's' on the end 

variable shadowing

