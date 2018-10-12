VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

computer_score = []
player_score = []

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

loop do
  loop do
    choice = ""
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      elsif choice.start_with?("s")
        prompt("do you mean Spock or Scissors?")
        s_answer = gets.chomp.downcase
        # update s_answer to loop and correct things
          if s_answer == "Spock"
            choice = "Spock"
            break
          elsif choice == "Scissors"
            break
          end
          # update choice == "P"
      elsif choice.start_with?("p")
        choice = "Paper"
        break
      elsif choice.start_with?("l")
        choice = "Lizard"
        break
      elsif choice.start_with?("r")
        choice = "Rock"
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}, computer chose #{computer_choice}.")

    if win?(choice, computer_choice)
      prompt("You won!")
      player_score << 1
    elsif win?(computer_choice, choice)
      prompt("Computer won.")
      computer_score << 1
    else
      prompt("It's a tie")
    end

    prompt("The score is => Computer: #{computer_score.sum}, Player: #{player_score.sum}")
    break if computer_score == 5 || player_score == 5
  end

  prompt("Do you want to play again? Y or N")
  answer = gets.chomp.downcase
  break unless answer.downcase.end_with?("y")
end

prompt("Thank you for playing, goodbye")
