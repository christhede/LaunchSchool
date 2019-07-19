# Write a program that given a phrase can count the occurrences of each word in that phrase.
# input: a phrase or sentance in a string
# output: a hash of each word, followed by the occurance

# class Phrase
#   attr_reader :hsh, :phrase

#   def initialize(phrase)
#     @phrase = phrase.downcase
#     @hsh = Hash.new(0)
#   end

#   def word_count
#     # iterate over the phrase of words, pulled out with the REGEX, and either add
#     @phrase.scan(/\b[\w+']+\b/).map {|x| @hsh[x] += 1 unless x.empty? }
#     p @hsh
#   end
# end

# phrase.word_count
# p phrase.hsh['ntwo']


# \b[\w+']+\b

class Phrase
  attr_reader :words, :count

  def initialize(words)
    @words = words
    @count = Hash.new(0)
  end

  def word_count

    @words.scan(/\b[\w']+\b/) do |word|
      @count[word.downcase] += 1
    end

    p @count
  end
end

phrase = Phrase.new('one,\ntwo,\nthree')
phrase.word_count