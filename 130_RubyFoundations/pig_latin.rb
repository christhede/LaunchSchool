# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.

# - word begings with a vowel %w(a e i o u), then add an 'ay' at the end of the word
# - if a word begins with a cononant sound, move it to the end of the word, then add 'ay' to it.
#     - move all the characters before the next vowel to the end**** 


# first, break up the sentance into words if needed.
# - break up word into characters.
# - iterate through the word, if the first letter is a consonant
    # - move consonant and following letters, until another vowel, to the end of the word

VOWELS = %w[A E I O U]

class PigLatin

  def self.translate(sentence)
    placeholder = []
    sentence.split.map do |word|
      if word.chars[0] == 'x' || VOWELS.include?(word[0].upcase)
        word + 'ay'
      else
        word = word.chars
        loop do
          second_letter = word[1]
          break if second_letter == 't'
          previous_letter = word.shift
          word << previous_letter
          break if VOWELS.include?(word.first.upcase) && previous_letter != 'q' 
        end
        word.join + 'ay'
      end
    end.join(' ')
  end
end

p PigLatin.translate('xenon')