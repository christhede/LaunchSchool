module Tools
  def clear
    system('clear')
  end

  def prompt(message)
    puts "=> #{message}"
  end
end

class GuessingGame
  include Tools

  def play
    loop do
      reset_game
      player_guessing_loop
      break unless play_again?
    end
    display_goodbye_message
  end

  def reset_game
    clear
    set_numbers
    @random_number = (@low_number..@high_number).to_a.sample
    @number_of_guesses = Math.log2((@low_number..@high_number).to_a.size).to_i + 1
  end

  def set_numbers
    loop do
      prompt "Please choose a number greater than 0"
      @low_number = gets.chomp.to_i
      break if @low_number > 0

      prompt "That is not a number greatr than 0. Try again"
    end

    loop do
      prompt "Please choose a number greater than #{@low_number}"
      @high_number = gets.chomp.to_i
      break if @high_number > @low_number

      prompt "That number is not greater than #{@low_number}. Please try again."
    end
  end

  def player_guessing_loop
    @guess = nil

    until out_of_guesses?

      loop do
        prompt "You have #{@number_of_guesses} guesses remaining."
        prompt "Enter a number between #{@low_number} and #{@high_number}:"
        @guess = gets.chomp.to_i
        break if (@low_number..@high_number).cover? @guess

        prompt "Invalid guess."
      end

      results
      break if guessed_correct?

      @number_of_guesses -= 1
      update_high_or_low_number
    end
    final_results
  end

  def guessed_correct?
    @guess == @random_number
  end

  def out_of_guesses?
    @number_of_guesses == 0
  end

  def update_high_or_low_number
    if @guess > @random_number
      @high_number = @guess
    elsif @guess < @random_number
      @low_number = @guess
    end
  end

  def final_results
    if out_of_guesses?
      prompt "You have no more guesses. You lost!"
    elsif guessed_correct?
      prompt "That's the number! You won!"
    end
  end

  def results
    if @guess > @random_number
      prompt "Your guess is too high"
    elsif @guess < @random_number
      prompt "Your guess is too low"
    end
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again?"
      answer = gets.chomp
      break if ['yes', 'y', 'n', 'no'].include? answer

      prompt "That is not a valid answer"
    end
    ['yes', 'y'].include? answer
  end
end

game = GuessingGame.new
game.play
