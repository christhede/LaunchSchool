hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


vowels = %w[a e i o u]

hsh.each do |place, details|
  details.each do |strings|
    strings.chars.select do |x|
      puts x if vowels.include?(x)
    end
  end
end
