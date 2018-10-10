def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word 
  end
  words.join(" ")
end

puts reverse_words("Professional") == "lanoisseforP"
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# reverse_words('Launch School')         # => hcnuaL loohcS