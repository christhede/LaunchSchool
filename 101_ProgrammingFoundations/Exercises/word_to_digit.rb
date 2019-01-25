# Write a method that takes a sentence string as input, 
# and returns the same string with any sequence of the words 
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 
# 'eight', 'nine' converted to a string of digits.

# create a constant hash where the keys are integers, and the value is the string representation of the integer
# define a method with one parameter 
# assign a local variable to an empty array
# call the mothod `split` on that parameter to seperate the words in an array
# iterate through the array, if the word == a key in the hash, pass the value through to the new array
# if not, pass the word

require 'pry'

HSH = {'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 
      'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9}

def word_to_digit(sentance)
  new_sentance = []

  sentance.split(/\b/).map do |word|

    if (HSH.keys).include?(word.to_sym)
      new_sentance << HSH[word.to_sym]
    else
      new_sentance << word
    end
    # binding.pry
  end

  p new_sentance.join
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
