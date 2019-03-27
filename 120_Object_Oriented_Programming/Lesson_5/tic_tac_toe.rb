require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def joinor(array, punc = ', ', conj = 'or')
    array.map do |num|
      if array.size == 1
        num.to_s
      elsif num == array[-1]
        "#{conj} #{num}"
      else
        "#{num}#{punc}"
      end
    end.join
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_game?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :name, :marker

  def initialize(name, marker)
    @marker = marker
    @name = name
    @score = 0
  end
end

class TTTGame
  LINE_BREAK = '---------------'.freeze
  WINNING_SCORE = 2

  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(human_chooses_name, human_chooses_marker)
    @computer = Player.new(computer_chooses_name, computer_chooses_marker)
    @current_marker = nil
  end

  def play
    clear
    display_welcome_message
    loop do
      reset_score
      board_reset

      main_game_loop

      display_match_winner
      break unless play_again?

      display_goodbye_message
    end
  end

  def main_game_loop
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won_game? || board.full?

        clear_screen_and_display_board
      end

      winner_awarded_point
      display_result
      break if someone_won_match?

      board_reset
      display_play_again_message
    end
  end

  def human_chooses_name
    clear
    puts "What is your name?"
    gets.chomp.capitalize
  end

  def computer_chooses_name
    %w(R2D2 C3PO Chappie).sample
  end

  def human_chooses_marker
    loop do
      puts "Please choose your marker."
      marker = gets.chomp
      break marker if marker.to_s.size == 1

      puts "Sorry, marker must be one character long"
    end
  end

  def computer_chooses_marker
    str = %w(& % $ # @ ! ^ * ? ~)
    str.delete(human.marker)
    str.sample
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe #{human.name}!"
    sleep(1)
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe #{human.name}! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human.name} VS #{computer.name}"
    puts LINE_BREAK
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts "First one to #{WINNING_SCORE} wins the game"
    puts LINE_BREAK
    display_score
    board.draw
    puts ""
  end

  def someone_won_match?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def display_match_winner
    if human.score == WINNING_SCORE
      puts "You won the match!"
    else
      puts "Computer won the match!"
    end
    sleep(1)
  end

  def display_score
    puts "Score => Human: #{human.score} Computer: #{computer.score}"
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def winner_awarded_point
    if board.winning_marker == human.marker
      human.score += 1
    elsif board.winning_marker == computer.marker
      computer.score += 1
    end
  end

  def human_moves
    puts "Choose a square (#{board.joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    sleep(1)
    if !!computer_offense
      computer_offense
    elsif !!computer_defense
      computer_defense
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_defense
    Board::WINNING_LINES.each do |line|
      squares = board.instance_variable_get(:@squares).values_at(*line)
      if two_human_markers_one_empty?(squares)
        empty_square = line.select { |x| board.unmarked_keys.include? x }
        return board[empty_square[0]] = computer.marker
      end
    end
    nil
  end

  def two_human_markers_one_empty?(squares)
    squares.select(&:marked?).collect(&:marker).count(computer.marker).zero? &&
      squares.select(&:marked?).collect(&:marker).count(human.marker) == 2
  end

  def computer_offense
    Board::WINNING_LINES.each do |line|
      squares = board.instance_variable_get(:@squares).values_at(*line)
      if two_computer_markers_one_empty?(squares)
        empty_square = line.select { |x| board.unmarked_keys.include? x }
        return board[empty_square[0]] = computer.marker
      end
    end
    nil
  end

  def two_computer_markers_one_empty?(squares)
    squares.select(&:marked?).collect(&:marker).count(computer.marker) == 2 &&
      squares.select(&:marked?).collect(&:marker).count(human.marker).zero?
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie."
    end
    sleep(1)
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer

      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def board_reset
    board.reset
    @current_marker = [human.marker, computer.marker].sample
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
