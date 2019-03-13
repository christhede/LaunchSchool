require 'pry'

LINE_BREAK = "————————————"
FIREWORKS = "************"
WINNING_SCORE = 2

module Tools
  def prompt(message)
    puts "=> #{message}"
  end
end

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
  include Tools
  attr_accessor :move, :name, :score, :choice, :weighted_values
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  CHOICES = ['rock', 'r', 'paper', 'p', 'scissors',
             'sc', 'spock', 'sp', 'lizard', 'l']

  def initialize
    @score = 0
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?

      prompt "Please tell me your name"
    end
    self.name = n
  end

  def choose
    choices = Player::VALUES.map(&:capitalize)
    loop do
      prompt "Please choose one: #{choices.to_s.gsub(/["'\[\]]/, '')}"
      self.choice = gets.chomp.downcase
      break if CHOICES.include? choice

      prompt "Sorry, invalid choice"
      sleep(1)
    end
    selected_choice(selected_name(choice))
  end

  def selected_name(pick)
    case pick
    when 'rock', 'r'        then self.choice = 'rock'
    when 'paper', 'p'       then self.choice = 'paper'
    when 'scissors', 'sc'   then self.choice = 'scissors'
    when 'lizard', 'l'      then self.choice = 'lizard'
    when 'spock', 'sp'      then self.choice = 'spock'
    end
    choice
  end

  def selected_choice(pick)
    case pick
    when 'rock'     then self.move = Rock.new
    when 'paper'    then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard'   then self.move = Lizard.new
    when 'spock'    then self.move = Spock.new
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
    choose_player
  end

  # computer chooses a player with different strenghts
  def choose_player
    case @name
    when 'R2D2'     then rtwodtwo
    when 'Hal'      then hal
    when 'Chappie'  then chappie
    end
  end

  def rtwodtwo
    self.weighted_values = { 'rock' => 0.40,
                             'paper' => 0.10,
                             'scissors' => 0.10,
                             'spock' => 0.10,
                             'lizard' => 0.30 }
  end

  def chappie
    self.weighted_values = { 'rock' => 0.10,
                             'paper' => 0.40,
                             'scissors' => 0.40,
                             'spock' => 0.10,
                             'lizard' => 0.00 }
  end

  def hal
    self.weighted_values = { 'rock' => 0.60,
                             'paper' => 0.10,
                             'scissors' => 0.10,
                             'spock' => 0.10,
                             'lizard' => 0.10 }
  end

  # throws a move at random
  def choose
    self.choice = weighted_random_selection

    case choice
    when 'rock'     then self.move = Rock.new
    when 'paper'    then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard'   then self.move = Lizard.new
    when 'spock'    then self.move = Spock.new
    end
  end

  # algorithm to randomly throw a move based on strengths
  def weighted_random_selection
    total_weight = @weighted_values.values.sum
    random_weight = rand(0.0..total_weight)
    @weighted_values.each do |item, weight|
      random_weight -= weight
      break item if random_weight <= 0
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
  include Tools
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_game_count
    prompt "Game #{@@round_counter}"
    puts LINE_BREAK
  end

  def display_welcome_message
    prompt "Welcome to Rock, Paper, Scissors!"
    human.set_name
    computer.choose_player
    prompt "Welcome #{human.name}, let's get started."
    sleep(1)
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors #{human.name}. Goodbye!"
    sleep(1)
  end

  def display_moves
    prompt "#{human.name} chose: #{human.choice}"
    sleep(1)
    prompt "#{computer.name} chose: #{computer.choice}"
    sleep(1)
  end

  def display_score
    prompt "First one to #{WINNING_SCORE} wins."
    prompt "#{human.name}: #{human.score}"
    prompt "#{computer.name}: #{computer.score}"
    puts LINE_BREAK
  end

  def human_won
    prompt "#{human.name} won!"
    @@winner = 'human'
  end

  def computer_won
    prompt "#{computer.name} won!"
    @@winner = 'computer'
  end

  def display_winner
    @@winner = nil
    if human.move.compare(computer.move)
      human_won
    elsif computer.move.compare(human.move)
      computer_won
    else
      prompt "It's a tie."
    end
    sleep(1)
  end

  def award_point_to_winner
    if human.move.compare(computer.move)
      human.add_score
    elsif computer.move.compare(human.move)
      computer.add_score
    end
  end

  def display_game_winner
    puts FIREWORKS
    if human.score == WINNING_SCORE
      prompt "#{human.name} won the game!"
    else
      prompt "#{computer.name} won the game!"
    end
    prompt "Player: #{human.score}"
    prompt "Computer: #{computer.score}"
  end

  def play_again?
    answer = nil

    loop do
      prompt "would you like to play again? (yes/no)"
      answer = gets.chomp.downcase
      break if ['y', 'n', 'yes', 'no'].include? answer.downcase

      prompt "Sorry, invalid answer"
      sleep(1)
    end

    ['y', 'yes'].include? answer.downcase
  end

  def display_previous_moves
    # binding.pry
    prompt "Previous moves:"
    dis_human_moves = @@human_moves.to_s.gsub(/[\{\}\"]/, '').gsub('=>', ' => ')
    dis_comp_moves = @@comp_moves.to_s.gsub(/[\{\}\"]/, '').gsub('=>', ' => ')

    if @@round_counter > 1
      prompt "#{human.name}: #{dis_human_moves}"
      prompt "#{computer.name}: #{dis_comp_moves}"
    end
    configure_computer_losing_words
    weight_of_computer_choices
    puts LINE_BREAK
  end

  def change_computer_weights
    computer.weighted_values.keys.map do |key|
      if key == item.keys[0]
        computer.weighted_values[key] = 0.10
      else
        computer.weighted_values[key] = 0.225 unless key == item[0]
      end
    end
  end

  def weight_of_computer_choices
    item = @@perc_comp_losing_words.select do |_, weight|
      weight >= 0.50 && @@human_wins >= 3
    end
    change_computer_weights if item.keys[0]
    computer.weighted_values
  end

  def configure_computer_losing_words
    if @@winner == 'human'
      @@human_wins += 1
      @@computer_losing_word_occurance[computer.choice] += 1
      @@computer_losing_word_occurance.map do |key, value|
        @@perc_comp_losing_words[key] = (value / @@human_wins.to_f).round(2)
      end
    end
    @@perc_comp_losing_words
  end

  def set_previous_moves
    @@human_moves["Game #{@@round_counter}"] = human.choice
    @@comp_moves["Game #{@@round_counter}"] = computer.choice
  end

  def reset_game
    human.reset_score
    computer.reset_score
    @@human_moves = Hash.new(0)
    @@comp_moves = Hash.new(0)
    @@round_counter = 1
    @@human_wins = 0
    @@computer_losing_word_occurance = Hash.new(0)
    @@perc_comp_losing_words = Hash.new(0)
    computer.set_name
  end

  def gameplay
    system("clear")
    display_game_count
    display_score
    display_previous_moves if @@round_counter > 1
    human.choose
    computer.choose
    display_moves
    display_winner
    award_point_to_winner
    set_previous_moves
    @@round_counter += 1
  end

  def play
    system("clear")
    display_welcome_message

    loop do
      reset_game
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
