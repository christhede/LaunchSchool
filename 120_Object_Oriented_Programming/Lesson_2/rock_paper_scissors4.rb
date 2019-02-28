require 'pry'

module Choices
  def scissors?(input)
    input == 'scissors'
  end

  def rock?(input)
    input == 'rock'
  end

  def paper?(input)
    input == 'paper'
  end

  def spock?(input)
    input == 'spock'
  end

  def lizard?(input)
    input == 'lizard'
  end
end

class Move
  include Choices

  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  # def initialize(value)
  #   @value = value
  # end

  # def compare(other_move)
  #   (scissors? && other_move.paper?) ||
  #     (paper? && other_move.rock?) ||
  #     (rock? && other_move.lizard?) ||
  #     (lizard? && other_move.spock?) ||
  #     (spock? && other_move.scissors?) ||
  #     (scissors? && other_move.lizard?) ||
  #     (lizard? && other_move.paper?) ||
  #     (paper? && other_move.spock?) ||
  #     (spock? && other_move.rock?) ||
  #     (rock? && other_move.scissors?)
  # end

  # def to_s
  #   @value
  # end
end

class Rock < Move
  def compare(other_move)
    other_move.class == Lizard || other_move.class == Scissors
  end

  def to_s
    @value
  end
end

class Paper 
  def compare(other_move)
    other_move.class == Rock || other_move.class == Spock
  end

  def to_s
    @value
  end
end

class Scissors
  def compare(other_move)
    other_move.class == Paper || other_move.class == Lizard
  end

  def to_s
    @value
  end
end

class Lizard
  def compare(other_move)
    other_move.class == Spock || other_move.class == Paper
  end

  def to_s
    @value
  end
end

class Spock
  def compare(other_move)
    other_move.class == Scissors || other_move.class == Rock
  end

  def to_s
    @value
  end
end

class Player
  include Choices
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts "Please tell me your name"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one: #{Move::VALUES}"
      choice = gets.chomp
      break if Move::VALUES.include? choice.downcase

      puts "Sorry, invalid choice"
    end
    self.move = choice
    case choice
    when rock?(choice)
      Rock.new
    when scissors?(choice)
      Scissors.new
    when paper?(choice)
      Paper.new
    when spock?(choice)
      Spock.new
    when lizard?(choice)
      Lizard.new
    end
  end

  def add_score
    self.score += 1
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie'].sample
  end

  def choose
    choice = Move::VALUES.sample
    self.move = choice
    case choice
    when rock?(choice)
      Rock.new
    when scissors?(choice)
      Scissors.new
    when paper?(choice)
      Paper.new
    when spock?(choice)
      Spock.new
    when lizard?(choice)
      Lizard.new
    end
  end

  def add_score
    self.score += 1
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer
  WINNING_SCORE = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_score
    puts "First one to #{WINNING_SCORE} wins the game."
    puts "Player: #{human.score}"
    puts "Computer: #{computer.score}"
  end

  def display_winner
    binding.pry
    if human.move.compare(computer.move)
      puts "#{human.name} won!"
    elsif computer.move.compare(human.move)
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
  end

  def add_score
    if human.move.compare(computer.move)
      human.add_score
    else
      computer.add_score
    end
  end

  def display_game_winner
    if human.score == WINNING_SCORE
      puts "#{human.name} won the game!"
    else
      puts "#{computer.name} won the game!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase

      puts "Sorry, invalid answer"
    end

    answer.downcase == "y"
  end

  def gameplay
    system("clear")
    display_score
    human.choose
    computer.choose
    display_moves
    display_winner
    add_score
  end

  def play
    system("clear")
    display_welcome_message

    loop do
      loop do
        gameplay
        break display_game_winner if human.score == WINNING_SCORE ||
                                     computer.score == WINNING_SCORE
      end
      display_score
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
