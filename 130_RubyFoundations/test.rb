# words are no larger thatn 20 letters
# text is one or more words, followed by a point


# example: "whats the matter with kansas."
# "whats eht matter htiw kansas."

# first, seperate all words with split
# then using each with index and map, if index is odd, reverse word, if not, leave it. if word contains a period, delete period, then after the odd words are reversed, add the period on the end. 
class WordSizeError < StandardError; end
class NoPointError < StandardError; end

def reverse_odds(words)
  raise NoPointError, "No point on end of text" if words.chars[-1] != '.'
  words.gsub('.', '').split.each_with_index.map do |word, idx|
    raise WordSizeError, 'Word too big' if word.size > 20
    if idx.odd?
      word.chars.reverse.join
    else
      word
    end
  end.join(' ') + '.'
end

p reverse_odds("kansas.   haha  .")