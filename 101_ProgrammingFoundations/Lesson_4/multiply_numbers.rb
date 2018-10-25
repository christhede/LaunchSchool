def multiply(numbers, multiple_of)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * multiple_of

    counter += 1
  end

  doubled_numbers
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)