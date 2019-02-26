class Move
  VALUES = ['rock', 'paper', 'scissors']

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
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) || 
      ()
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
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
      puts "Please choose Rock, Paper or Scissors"
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
    puts "Player: #{human.score}"
    puts "Computer: #{computer.score}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.add_score
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.add_score
    else
      puts "It's a tie."
    end
  end

  def display_game_winner
    if human.score == 10
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

  def play
    display_welcome_message
    loop do 
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        break display_game_winner if human.score == 3 || computer.score == 3
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
