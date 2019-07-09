# input: a string containing words, spaces and a period. Words do not exceed 20 letters.

# output:the same string, but odd words reversed
# BONUS: must output character by character

# first, we need to seperate the words into arrays, to be able to iterate over them with split.

def odd_words(sentance)
  new_sentence = ''
  sentance = sentance.split.map {|word| word.chars }

  sentance.each_with_index do |obj, idx|
    if idx.odd?
      obj.reverse.each do |x|
        next if x == '.'
        new_sentence << x
      end
    else
      obj.each { |x| new_sentence << x }
    end
    new_sentence << ' ' unless idx == sentance.size-1
  end
  new_sentence
end

p odd_words('whats the matter with kansas anymore.')
p odd_words('.')
p odd_words('hello world.')