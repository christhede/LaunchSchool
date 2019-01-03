require 'pry'

def word_to_digit(string)
  new_sentance = []
  string.split().each do |word|
    if word.end_with?('?', '.', '!')
      word = word.chop
    else 
      word
    end

    case word
    when 'one'   then new_sentance << '1'
    when 'two'   then new_sentance << '2'
    when 'three' then new_sentance << '3'
    when 'four'  then new_sentance << '4'
    when 'five'  then new_sentance << '5'
    when 'six'   then new_sentance << '6'
    when 'seven' then new_sentance << '7'
    when 'eight' then new_sentance << '8'
    when 'nine'  then new_sentance << '9'
    else new_sentance << word
    end
    # binding.pry
  end
  puts new_sentance.join(' ')
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
puts 'Please call me at 5 5 5 1 2 3 4. Thanks.'