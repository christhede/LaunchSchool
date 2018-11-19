def swap(sentance)
  new_sentance = sentance.split.each do |word|
    first = word.chars[0]
    last = word.chars[-1]
    word[0] = last
    word[-1] = first
  end
  new_sentance.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
