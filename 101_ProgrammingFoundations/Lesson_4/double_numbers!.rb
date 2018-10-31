def double_odd_numbers_at_indicies(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_index = current_number.index
    current_number *= 2 if current_index.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers_at_indicies(my_numbers)  # => [2, 4, 6, 14, 2, 6]
