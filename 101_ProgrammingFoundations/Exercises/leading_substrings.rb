require 'pry'

def substrings(string)
  new_array = []
  new_string = string
  loop do
    index = 0
    loop do
      new_array << new_string[0..index]
      index += 1
      break if index == new_string.chars.count
    end
    new_string = new_string.chars.drop(1).join
    binding.pry
    break if new_string.empty?
  end
  puts new_array
end

substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]