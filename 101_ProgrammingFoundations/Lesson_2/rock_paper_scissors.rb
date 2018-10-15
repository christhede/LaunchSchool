VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

WINS = { "Scissors": ["Paper", "Lizard"],
         "Paper": ["Rock", "Spock"],
         "Rock": ["Lizard", "Paper"],
         "Spock": ["Scissors", "Rock"],
         "Lizard": ["Spock", "Paper"] }

computer_score = 0
player_score = 0
choice = ""
s_choice = ""

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "Rock" && second == WINS[:Rock]) ||
    (first == "Paper" && second == WINS[:Paper]) ||
    (first == "Scissors" && second == WINS[:Scissors]) ||
    (first == "Lizard" && second == WINS[:Lizard]) ||
    (first == "Spock" && second == WINS[:Spock])
end

loop do
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp.downcase.capitalize

      if VALID_CHOICES.include?(choice)
        break
      elsif choice.downcase == "s"
        prompt("Please choose Spock or Scissors:")
        s_choice = gets.chomp.downcase
        if s_choice == "spock"
          choice = "Spock"
          break
        elsif s_choice == "scissors"
          choice = "Scissors"
          break
        else
          prompt("That is not a valid choice. Please choose Spock or Scissors")
        end
      elsif choice.downcase == "p"
        choice = "Paper"
        break
      elsif choice.downcase == "l"
        choice = "Lizard"
        break
      elsif choice.downcase == "r"
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
      player_score += 1
    elsif win?(computer_choice, choice)
      prompt("Computer won.")
      computer_score += 1
    else
      prompt("It's a tie")
    end

    prompt("Computer: #{computer_score}, Player: #{player_score}")

    if computer_score == 5
      prompt("The computer won the match #{computer_score}-#{player_score}")
      break
    elsif player_score == 5
      prompt("The player won the match #{player_score}-#{computer_score}")
      break
    end
  end

  computer_score = 0
  player_score = 0
  prompt("Do you want to play again? Y or N")
  answer = gets.chomp.downcase
  break unless answer.downcase.end_with?("y")
end

prompt("Thank you for playing, goodbye")
