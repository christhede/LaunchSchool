class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    (scissors? && other_move.paper?) ||
      (paper? && other_move.rock?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (paper? && other_move.spock?) ||
      (spock? && other_move.rock?) ||
      (rock? && other_move.scissors?)
  end

  def to_s
    @value
  end
end

class Player
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
    self.move = Move.new(choice)
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
    self.move = Move.new(Move::VALUES.sample)
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
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
  end

  def add_score
    if human.move > computer.move
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
