require 'pry'

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    new_string = string[0..index]
    result << new_string if new_string == new_string.reverse && 
                            new_string.size > 1
  end
  result
end

def palindromes(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
    binding.pry 
  end
  results
end

# puts palindromes('MadaM') # == ['madam', 'ada']

puts palindromes('knitting cassettes') # == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]