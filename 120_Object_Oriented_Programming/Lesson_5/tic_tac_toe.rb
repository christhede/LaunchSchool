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
        "#{num}"
      elsif num == array[-1]
        "#{conj} #{num.to_s}"
      else
        "#{num.to_s}#{punc}"
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
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  WINNING_SCORE = 2

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    loop do
      reset_score
      board_reset

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

      display_match_winner
      break unless play_again?
      display_goodbye_message
    end
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts "First one to #{WINNING_SCORE} wins the game"
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
    if board.winning_marker == HUMAN_MARKER
      human.score += 1
    elsif board.winning_marker == COMPUTER_MARKER
      computer.score += 1
    else
      nil
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
    board[board.unmarked_keys.sample] = computer.marker unless computer_defense unless computer_offense
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
    squares.select(&:marked?).collect(&:marker).count(COMPUTER_MARKER) == 0 &&
    squares.select(&:marked?).collect(&:marker).count(HUMAN_MARKER) == 2
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
    squares.select(&:marked?).collect(&:marker).count(COMPUTER_MARKER) == 2 &&
    squares.select(&:marked?).collect(&:marker).count(HUMAN_MARKER) == 0
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
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
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play