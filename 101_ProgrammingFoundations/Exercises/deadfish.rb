# Write a simple parser that will parse and run Deadfish.

# Deadfish has 4 commands, each 1 character long:

# i increments the value (initially 0)
# d decrements the value
# s squares the value
# o outputs the value into the return array
# Invalid characters should be ignored.
require 'pry'

def deadfish(string)
    str = string.chars
    value = 0
    return_array = []
    str.each do |x|
        case
        when 'i' then value += 1
        when 'd' then value -= 1
        when 's' then value = value ** 2
        when 'o' then return_array << value
        end
        binding.pry
    end
    return_array
end




p deadfish("iiisdoso") # ==>  [8, 64]