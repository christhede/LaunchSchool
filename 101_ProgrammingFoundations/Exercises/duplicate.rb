# Write a method that takes a string argument and returns a new string that contains 
# the value of the original string with all consecutive duplicate characters collapsed 
# into a single character.

# Input: ‘bbbbbbbbb’ → Output: ‘b’
# Input: ‘wwooonndeerrfull woorrlldd’ → Output: ‘wonderful world’

def duplicate(string)
  string.split.map {|word| word.chars.uniq.join}.join(' ')
end

p duplicate('bbbbbbbbb')
p duplicate('wwooonndeerrfull woorrlldd')