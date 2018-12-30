def diamond(num)
  distance = (num / 2).floor
  number_of_asterisks = 1

  distance.downto(1) do |number_of_spaces|
    puts ' ' * number_of_spaces + '*' * number_of_asterisks
    number_of_asterisks += 2
  end

  0.upto(distance) do |number_of_spaces|
    puts ' ' * number_of_spaces + '*' * number_of_asterisks
    number_of_asterisks -= 2
  end
end

diamond(7)
