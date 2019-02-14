require 'pry'

NUMBERS = {zero: '0', one: '1', two: '2', three: '3', four: '4',
          five: '5', six: '6', seven: '7', eight: '8', nine: '9'}


def computer(english)
  new_str = ''
  str = english.split.map {|x| x.gsub('divided', 'divided by')}
  str.delete('by')
  str.map do |word|
    if NUMBERS.keys.include?(word.to_sym)
      new_str << NUMBERS[word.to_sym]
    else
      # binding.pry
      case word
      when 'plus'       then new_str << '+'
      when 'minus'      then new_str << '-'
      when 'times'      then new_str << '*'
      when 'divided by' then new_str << '/'
      end
    end
  end
  p eval new_str
end

# computer('two plus two')
# computer('zero plus eight plus nine minus six')
computer('one plus four times three divided by two minus two')

# first, create a hash where the keys are the english and the values are numbers
# use if..end statements to move through code and place the right operator when needed
# create another hash where the keys are the operators and the values are the shorthand?
# iterate through english, passing in the value to a new array
# return the new array as a string