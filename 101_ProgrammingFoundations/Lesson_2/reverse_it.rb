def reverse_sentence(words)
  words.split.reverse.join(" ")
end

puts reverse_sentence('Hello World')
puts reverse_sentence('Hello World') == "World Hello"
puts reverse_sentence('Reverse these words')
puts reverse_sentence('Reverse these words') == "words these Reverse"
