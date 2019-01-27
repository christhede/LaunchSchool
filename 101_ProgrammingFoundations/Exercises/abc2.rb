# In the easy exercises, we worked on a problem where we had to count the 
# number of uppercase and lowercase characters, as well as characters that 
# were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that 
# contains 3 entries: one represents the percentage of characters in the 
# string that are lowercase letters, one the percentage of characters that 
# are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# our method will take one string parameter
# create an empty hash with the keys :lowercase, :uppercase, :lowercase
# break parameter into separate characters with #chars method
# use flow control to add 1 each time to hash: 
  # if uppercase
  # elsif lowercase
  # else neither
# divide each hash value by string.size to find out percentage
# returns a hash of 3 entries: lowercase:. uppercase:, neitehr
require ''

def letter_percentages(string)
  hsh = Hash.new{0}

  string.chars.each do |letter|
    if letter.match(/[A-Z]/)
      hsh[:lowercase] += 1
    elsif letter.match(/[a-z]/)
      hsh[:uppercase] += 1
    else 
      hsh[:neither] += 1
    end
    # binding.pry
  end
  hsh.map do |key, value|
    hsh[key] = (value / string.size.to_f) * 100
  end
  binding.pry

  hsh
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# from lines 23 - 41 we initialiaze the method `letter_percentages` that takes one paramter `string`
# on line 24 we initialize the local variable `hsh` and assign it to an empty hash with values of 0

# on line 26 we call the `chars` method on the object `string` and then call the iterative method `each` 
# on that from lines 26 - 35, which passes in a do...end block as it's argument with one block parameter `letter`

# on line 27 we have a flow control if statement, which checks to see if the paramter `letter` 
# being passed through the block matches what is being passed into the if statement. 
# In this case, the parameter `letter` is being called on the method `match` with one parameter, in this case, a regex pattern. 
# The regex pattern `(/[A-Z]/)` checks to see if `letter` is included in the range of A - Z of uppercase letters in the alphabet.

# On line 28, we are reassigning the hash key `:lowercase` with a value of += 1. 
# This can also be written as hsh[:lowercase] = hsh[:lowercase] + 1.

# On line 29, we come to another flow control, `elsif` which if the first if statement came back false, then the `letter` 
# would flow to this `elsif` statement. In this case, the letter is passed to the method #match with one paramter, the regex (/[a-z]/)
# which checks to see if `letter` is included in the range of lower case alphabet characters, a to z. 

# On line 30, if line 29 is is true, then the hash key `:uppercase` is reassigned to add 1. 
# This can also be written as key[:uppercase] = key[:uppercase] + 1.

# On line 31 now, we have the final flow control statement `else`. If both the `if` and `elsif` statement remain false, then `else` is called
# and reassigns the hash key `:neither` to += 1. This, again, can be written as key[:neither] = key[:neither] + 1.

# On line 36 we have the mehtod #map being called on the hash `hsh` and passing in a do..end block as it's argument with two 
# parameters `key` and `value`. Then on line 37, we are assigning the key objects in hsh to the value of `value` divided by 
# the size of the string, by calling the method `size` on `string` as well as the method `to_f` to convert the number to a float integer. 
# Then we multiply that number by 100. The return value of the `map` method then is an array of hsh[]



