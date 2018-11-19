hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = %w(a e i o u)
hsh.each do |name, details|
   details.each do |x|
    x.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
