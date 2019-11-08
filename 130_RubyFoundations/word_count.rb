# count the number of words 

class Phrase
  attr_reader :sentance

  def initialize(sentance)
    @sentance = sentance
  end

  def word_count
    words = Hash.new(0)
    @sentance.scan(/\w+'\w+|\w+/).map {|word| words[word.downcase] += 1 }
    words
  end

end

phrase = Phrase.new("one fish two fish red fish blue fish 'large'")
phrase.word_count