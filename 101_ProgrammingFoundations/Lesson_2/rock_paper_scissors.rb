VALID_CHOICES = %w(Rock Paper Scissors)

def win?(first, second)
  (first == "Rock" && second == "Scissors") ||
  (first == "Paper" && second == "Rock") ||
  (first == "Scissors" && second == "Paper")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won.")
  else
    prompt("It's a tie")
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = ["Rock", "Paper", "Scissors"].sample

  prompt("You chose #{choice}, computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again? Y or N")
  answer = gets.chomp.downcase
  break unless answer.downcase.end_with?("y")
end

prompt("Thank you for playing, goodbye")
