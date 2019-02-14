def word_cap(string)
  string.split.map { |word| word.capitalize}.join(' ')
end

# input: a string
# convert string to array by splitting up the sentence into words in an array 
  # to be able to iterate through them
# use the map iterator to iterate through each word, capitalizing each with #capitalize
# use #join on the end of the #map method to join all words together
# output: a string



p word_cap('four score and seven shore')