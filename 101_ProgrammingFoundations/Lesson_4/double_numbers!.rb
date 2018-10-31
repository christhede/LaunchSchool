def double_numbers!(numbers)
  counter = 0 #counter starts at 0

  loop do
    break if counter == numbers.size # if counter = numbers.size, break

    current_number = numbers[counter]
    numbers[counter] = current_number * 2 # current number is multiplying 

    counter += 1
  end

  p numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers).size # => [2, 8, 6, 14, 4, 12]