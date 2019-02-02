# Write a method that takes a string, and returns a new string 
# in which every character is doubled.

# input: a string
# # create new string variable
# 1. break string into seperate characters with #chars
# 2. iterate through string, adding that character element back into new_str variable the string at that momnet
# 3. output new string

# output: a string

def repeater(string)
  new_str = ''

  string.chars.each { |x| new_str << x * 2 }
  new_str
end


p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') #== ''

