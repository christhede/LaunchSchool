require 'pry'

GOOD_TROOPS_VALUE = [1, 2, 3, 3, 4, 10].freeze
EVIL_TROOPS_VALUE = [1, 2, 2, 2, 3, 5, 10].freeze

def goodVsEvil(good, evil)
  num_good_troops = 0
  num_evil_troops = 0

  good.split.each_with_index do |number_of_troops, index|
    num_good_troops += number_of_troops.to_i * GOOD_TROOPS_VALUE[index]
  end

  evil.split.each_with_index do |number_of_troops, index|
    num_evil_troops += number_of_troops.to_i * EVIL_TROOPS_VALUE[index]
  end
  who_wins(num_good_troops, num_evil_troops)
end

def who_wins(good, evil)
  if good > evil
    'Battle Result: Good triumphs over Evil'
  elsif evil > good
    'Battle Result: Evil eradicates all trace of Good'
  else
    'Battle Result: No victor on this battle field'
  end
end

goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')
goodVsEvil('1 0 0 0 0 0', '1 0 0 0 0 0 0')

# method takes two parameters, one with good numbers, one with evil numbers
# their order in which each member comes is stated earlier.
# use the order in which each infantry comes in the string, and use as an index to select out of the hash
# multiply that together and add it to a local variable for #good_numbers and #evil_numbers
# iterate through the string of numbers, and using the index, find the right infantry, and add
# that number to the #good_numbers variable
# after iterating through each string, compare both numbers and return an answer
