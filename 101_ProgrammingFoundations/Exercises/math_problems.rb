# input: a length
# create a new array to hold our math problem
# use the downto method to loop from length to 0
# on each iteration, we will generate a random NUMBER and add it to array
# as well as generate a random OPERATOR and add it to array
# output: a random math problem with length many operations

NUMBERS = %w(one two three four five six seven eight nine)
OPERATORS = ['plus', 'minus', 'times', 'divided by']

def mathphrases(length)
  arr = []
  length.times do |x|
    arr << NUMBERS.sample
    arr << OPERATORS.sample
  end
  arr << NUMBERS.sample
  arr.join(' ')
end


10.times { puts mathphrases (0..20).to_a.sample }

