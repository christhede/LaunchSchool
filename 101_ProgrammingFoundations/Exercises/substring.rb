# write a method that will return a substring based on the specific ndices.

# input: a string, with two indices as arguments
# 1. change the string into an array to select indices 
# 2. create a range out of the two indices ( ex. 1..5)
# 3. select the letters out of array with array[a..b]

def substring(string, idx1, idx2 = nil)
  return string[idx1] if !idx2
  string.chars[idx1..idx2].join
end 

# p substring('honey', 0, 2)
# p substring('honey', 1, 2)
# p substring('honey', 3, 9)
# p substring('honey', 2)

# write a method that finds all substrings within a string

# input: a string
# 1.A create two variables to hold the indexes.
# ex. idx1 = 0 idx2 = 1
# 1. convert string to array with chars
# 2. we need to loop through the string using indexes 
# at first, only changing adding += 1 to the second index, until we've reached the 
# end of the string
# 3. then start the second loop at index 2 through to the end of the index adding 
# the return value a new array each time
# output: an array of substrings

def substrings(string)
  new_array = []
  idx1 = 0
  idx2 = 1

  while idx1 < string.size - 1
    while idx2 < string.size
      new_array << substring(string, idx1, idx2)
      idx2 += 1
    end
    idx1 += 1
    idx2 = idx1 + 1
  end
  new_array
end

# write a method that will return all substrings that are palindromes within a string

def palindromes(string)
  substrings(string).select { |word| word == word.reverse }
end

# write a method that finds the largest palindrome within a string

# create a varialbe word_count = ''
# iterate through array comparing word.size to word_count.size
# if word.size > word_count.size, 
  # word_count = word
# else 
  # nothing

def largest_palindrome(string)
  arr = palindromes(string)
  word_count = ''
  arr.each { |word| word_count = word if word.size > word_count.size }
  word_count
end


# p substrings('lessel')
# p palindromes('lessel') #== ['pp', 'pop']
p largest_palindrome('lvle') #== "lessel"


