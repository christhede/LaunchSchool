hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


vowels = 'a', 'e', 'i', 'o', 'u'

hsh.each do |place, details|
  puts details.chars
end
