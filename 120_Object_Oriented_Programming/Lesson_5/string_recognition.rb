def vowel_recognition input
  counter = 0
  total = 0
  input = input.chars

  loop do
    input.each_with_index do |_, idx|
      new_arr = input[counter..idx]
      total += new_arr.join.count("aeiouAEIOU")
    end

    break if counter == input.size
    counter += 1
  end

  total
end

# input: str of upper and lowercase vowles and consanents

# use str.size to find out how many times to iterate through, to gather substrings
# first, iterate through string, outputting the substring
  # use chars to split string into array
  # use each to iterate through str, outputting counter - x
  # use #count to count the number of vowels
  # add that number to the running total with total += n
# output: sum of vowels in each substrings

vowel_recognition("baceb") # 16