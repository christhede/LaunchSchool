# Write a function to convert a name into initials. This kata strictly takes 
# two words with one space in between them.

# The output should be two capital letters with a dot seperating them.

# It should look like this:

# Sam Harris => S.H

# Patrick Feeney => P.F

# input: one string

# split string into separate words
# push first letter of word to a new string with one period in between
# 

def abbrev_name(string)
  string.split.map { |word| word[0].capitalize}.join('.')
end

p abbrev_name('Sam Harris')
 
# output: one string