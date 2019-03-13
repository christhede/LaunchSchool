class GuessingGame
  def initialize
    @random_num = rand(0..100)
    @number_of_guesses = 7
  end

  def remaining_guesses
    puts "You have #{@number_of_guesses} remaining."
  end

  def valid_answer
    (1..100).cover?(@@answer)
  end

  def play
    until @number_of_guesses == 0
      remaining_guesses
      puts "Enter a number between 1 and 100:"
      @@answer = gets.chomp.to_i

      if valid_answer
        if @@answer == @random_num
          puts "That's the number!"
          break
        elsif @@answer > @random_num
          puts "Your guess is too high."
        elsif @@answer < @random_num
          puts "Your guess is too low."
        end
      else
        puts "Invalid guess. Enter a number between 1 and 100"
      end

      @number_of_guesses -= 1
    end
  end
end



game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!


# if guess == rand_num 
#   puts "That's the number!"
# if guess is lower than rand_num 
  # puts "Your guess is too low."
# elsif
  # puts "Your guess is too high."
