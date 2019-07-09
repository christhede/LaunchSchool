# input: word and list of words
# output: an array of anagrams

# first, find how to match an anagram.
# convert word to seperate character, and sort them.
# then match that sorted word to the sorted word from list


class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    word = @word.chars.sort.join
    list.select do |x| 
      x = x.downcase
      next if x == @word
      word == (x.chars.sort.join)
    end
  end
end

# detector = Anagram.new('Orchestra')
# p detector.match(%w(cashregister Carthorse radishes))