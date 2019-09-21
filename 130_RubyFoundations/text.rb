# file = File.open('sample_text.txt', 'r')

class Text
  # attr_reader :text

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

# text = Text.new(file.read)
# p text.word_count