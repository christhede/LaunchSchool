def select_letter(sentance, character)
  selected_chars = ''
  counter = 0

  loop do 
    break if counter == sentance.size

    current_char = sentance[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end
  selected_chars
end

question = "boobies are the best boi"
p select_letter(question, 'b')