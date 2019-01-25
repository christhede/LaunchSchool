# Write a method that returns true if the string passed as an argument 
# is a palindrome, false otherwise. A palindrome reads the same forward 
# and backward. For this exercise, case matters as does punctuation and spaces.


# method definition with one parameter, 'string'
# split string into single characters using chars to get an array of the string characters
# initialize variables as index1 = 0 and index2 = -1
# loop through the array and checking to see if index1 == index2 match each other
# if they match, move onto next index value by adding 1 to inde1, and adding -1 to index2
# break the loop if index1 != index2 OR index1 == chars.size / 2.floor


def real_palindrome?(string)
  characters = string.downcase.gsub(/[^a-z0-9]/, '')
  characters == characters.reverse
end

puts real_palindrome?('madam') # == true
puts real_palindrome?('Madam') # == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") # == true # (only alphanumerics matter)
puts real_palindrome?('356653') # == true
puts real_palindrome?('356a653') # == true
puts real_palindrome?('123ab321') # == false