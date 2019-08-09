# input: a word

# output: a list of words that are anagrams 

# if word.chars.sort == list[a].chars.sort, then list[a] is an anagram of word, and is added to the list



class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select { |x| anagram?(x.downcase) }
  end

  def anagram?(x)
    x != @word && x.chars.sort == @word.chars.sort
  end
end


detector = Anagram.new('corn')
anagrams = detector.match %w(corn dark Corn rank CORN cron park)
p anagrams