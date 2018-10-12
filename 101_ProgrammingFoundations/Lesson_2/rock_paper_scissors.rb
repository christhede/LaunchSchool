VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

def game_score(input)
computer_score = []
player_score = []
  if input == 1
    player_score << 1
  elsif 
    input == 2
    computer_score << 1
  end
  prompt("the score is computer:#{computer_score}, player:#{player_score}")
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
    game_score(1)
  elsif 
    win?(computer, player)
    prompt("Computer won.")
    game_score(2)
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

  display_results(choice, computer_choice)

  prompt("Do you want to play again? Y or N")
  answer = gets.chomp.downcase
  break unless answer.downcase.end_with?("y")
end


prompt("Thank you for playing, goodbye")
