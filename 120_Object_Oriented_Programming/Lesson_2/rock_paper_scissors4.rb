require 'pry'

class Rock
  def compare(other_move)
    other_move.class == Lizard || other_move.class == Scissors
  end
end

class Paper
  def compare(other_move)
    other_move.class == Rock || other_move.class == Spock
  end
end

class Scissors
  def compare(other_move)
    other_move.class == Paper || other_move.class == Lizard
  end
end

class Lizard
  def compare(other_move)
    other_move.class == Spock || other_move.class == Paper
  end
end

class Spock
  def compare(other_move)
    other_move.class == Scissors || other_move.class == Rock
  end
end

class Player
  attr_accessor :move, :name, :score, :choice
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize
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
    self.choice = nil
    choices = Player::VALUES.map(&:capitalize)
    loop do
      puts "Please choose one: #{choices.to_s.gsub(/["'\[\]]/, '')}"
      self.choice = gets.chomp.downcase
      break if Player::VALUES.include? choice

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

  def reset_score
    self.score = 0
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie'].sample
  end

  def choose
    self.choice = Player::VALUES.sample

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

  def reset_score
    self.score = 0
  end
end

# Game Orchestration Engine
class RPSGame
  LINE_BREAK = "————————————"
  FIREWORKS = "************"
  attr_accessor :human, :computer
  WINNING_SCORE = 7

  def game_count
    puts "Game #{@@round_counter}"
    puts LINE_BREAK
  end

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    human.set_name
    computer.set_name
    puts "Welcome #{human.name}, let's get started."
    sleep(1)
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.choice}"
    puts "#{computer.name} chose: #{computer.choice}"
    sleep(1)
  end

  def display_score
    puts "First one to #{WINNING_SCORE} wins."
    puts "Player: #{human.score}"
    puts "Computer: #{computer.score}"
    puts LINE_BREAK
  end

  def display_winner
    @@winner = nil
    if human.move.compare(computer.move)
      puts "#{human.name} won!"
      @@winner = 'human'
    elsif computer.move.compare(human.move)
      puts "#{computer.name} won!"
      @@winner = 'computer'
    else
      puts "It's a tie."
    end
    sleep(1)
  end

  def add_score
    if human.move.compare(computer.move)
      human.add_score
    elsif computer.move.compare(human.move)
      computer.add_score
    end
  end

  def display_game_winner
    puts FIREWORKS
    if human.score == WINNING_SCORE
      puts "#{human.name} won the game!"
    else
      puts "#{computer.name} won the game!"
    end
    puts "Player: #{human.score}"
    puts "Computer: #{computer.score}"
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

  def display_previous_moves
    puts "Previous moves:"
    display_human_moves = @@human_moves.to_s.gsub(/[\{\}\"]/, '').gsub('=>', ' => ')
    display_comp_moves = @@computer_moves.to_s.gsub(/[\{\}\"]/, '').gsub('=>', ' => ')
    if @@round_counter > 1
      puts "#{human.name}: #{display_human_moves}"
      puts "#{computer.name}: #{display_comp_moves}"
    end
    occurance_of_human_winning_words
    puts LINE_BREAK
  end

  def occurance_of_human_winning_words
    if @@winner == 'human'
      @@human_wins += 1
      @@human_winning_word_occurance[human.choice] += 1
      new_hash = @@human_winning_word_occurance
      @@human_winning_word_occurance.map { |key, value| @@percentage_of_human_winning_words[key] = (value/@@human_wins.to_f).round(2) }
      @@percentage_of_human_winning_words
    end
  end

  def set_previous_moves
    @@human_moves["Game #{@@round_counter}"] = human.choice
    @@computer_moves["Game #{@@round_counter}"] = computer.choice
  end

  def reset_score
    human.reset_score
    computer.reset_score
  end

  def gameplay
    system("clear")
    game_count
    display_score
    display_previous_moves if @@round_counter > 1
    human.choose
    computer.choose
    display_moves
    display_winner
    add_score
    set_previous_moves
    @@round_counter += 1
  end

  def play
    system("clear")
    display_welcome_message

    loop do
      reset_score
      @@human_moves = Hash.new(0)
      @@computer_moves = Hash.new(0)
      @@round_counter = 1
      @@human_wins = 0
      @@human_winning_word_occurance = Hash.new(0)
      @@percentage_of_human_winning_words = Hash.new(0)
      loop do
        gameplay
        break if human.score == WINNING_SCORE || computer.score == WINNING_SCORE
      end
      display_game_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
