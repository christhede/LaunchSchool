VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "Scissors" && second == "Paper") ||
    (first == "Paper" && second == "Rock") ||
    (first == "Rock" && second == "Lizard") ||
    (first == "Lizard" && second == "Spock") ||
    (first == "Spock" && second == "Scissors") ||
    (first == "Scissors" && second == "Lizard") ||
    (first == "Lizard" && second == "Paper") ||
    (first == "Paper" && second == "Spock") ||
    (first == "Spock" && second == "Rock") ||
    (first == "Rock" && second == "Scissors")
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

computer_score = []
player_score = []

loop do
  loop do
    choice = ""
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      elsif choice.downcase.start_with?("s")
        prompt("do you mean Spock or Scissors?")
        s_answer = gets.chomp
          if s_answer == "Spock"
            choice = "Spock"
            break
          else 
            choice = "Scissors"
            break
          end
      elsif choice.downcase.start_with?("p")
        choice = "Paper"
        break
      elsif choice.downcase.start_with?("l")
        choice = "Lizard"
        break
      elsif choice.downcase.start_with?("r")
        choice = "Rock"
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}, computer chose #{computer_choice}.")

    score = display_results(choice, computer_choice)

    if score == "Computer won."
      computer_score << 1
    elsif score == "You won!"
      player_score << 1
    end

    prompt("The score is => Computer: #{computer_score.sum}, Player: #{player_score.sum}")
    break if computer_score == 5 || player_score == 5
  end

  prompt("Do you want to play again? Y or N")
  answer = gets.chomp.downcase
  break unless answer.downcase.end_with?("y")
end

prompt("Thank you for playing, goodbye")
