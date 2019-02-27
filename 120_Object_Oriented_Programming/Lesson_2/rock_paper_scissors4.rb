require 'pry'

class Rock
  def >(other_move)
    other_move.class == Lizard || other_move.class == Scissors
  end

  def to_s
    @value
  end
end

class Paper 
  def >(other_move)
    other_move.class == Rock || other_move.class == Spock
  end

  def to_s
    @value
  end
end

class Scissors
  def >(other_move)
    other_move.class == Paper || other_move.class == Lizard
  end

  def to_s
    @value
  end
end

class Lizard
  def >(other_move)
    other_move.class == Spock || other_move.class == Paper
  end

  def to_s
    @value
  end
end

class Spock
  def >(other_move)
    other_move.class == Scissors || other_move.class == Rock
  end

  def to_s
    @value
  end
end

class Player
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  # include Choices

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  attr_accessor :move, :name, :score
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
      puts "Please choose one: #{Player::VALUES}"
      choice = gets.chomp
      break if Player::VALUES.include? choice.downcase

      puts "Sorry, invalid choice"
    end
    
    case choice
    when 'rock' then self.move = Rock.new
    when 'paper' then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard' then self.move = Lizard.new
    when 'spock' then self.move = Spock.new
    end
  end

  def add_score
    self.score += 1
  end
end

class Computer < Player
  attr_accessor :move, :name, :score
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie'].sample
  end

  def choose
    choice = Player::VALUES.sample

    case choice
    when 'rock' then self.move = Rock.new
    when 'paper' then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard' then self.move = Lizard.new
    when 'spock' then self.move = Spock.new
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
    puts "#{human.name} chose: #{human.move.class}"
    puts "#{computer.name} chose: #{computer.move.class}"
  end

  def display_score
    puts "First one to #{WINNING_SCORE} wins the game."
    puts "Player: #{human.score}"
    puts "Computer: #{computer.score}"
  end

  def display_winner
    if human.move.>(computer.move)
      puts "#{human.name} won!"
    elsif computer.move.>(human.move)
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
  end

  def add_score
    if human.move.>(computer.move)
      human.add_score
    elsif computer.move > human.move
      computer.add_score
    else
      nil
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
    # system("clear")
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
