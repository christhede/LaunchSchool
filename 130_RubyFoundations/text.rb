# require_relative 'sample_text'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

# file = File.open('sample_text.txt')

# text = Text.new(file.read)
# # p file.read
# p text.word_count