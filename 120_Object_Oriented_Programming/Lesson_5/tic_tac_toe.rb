require 'pry'

# board class
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(square, marker)
    @squares[square].marker = marker
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts ''
    puts '     |     |     '
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts '     |     |     '
    puts '-----+-----+-----'
    puts '     |     |     '
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts '     |     |     '
    puts ''
  end
  # rubocop:enable Metrics/AbcSize

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

# square class
class Square
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
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

# player class
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

# TTTgame class
class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMP_MARKER = 'O'.freeze

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMP_MARKER)
    @current_player = %w[human computer].sample
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?

        clear_screen_and_display_board if human_turn?
        alternate_current_player
      end

      display_results
      break unless play_again?

      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe'
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square between #{board.unmarked_keys.join(', ')}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts 'Sorry, that is not a valid choice'
    end
    board[square] = human.marker
  end

  def computer_moves
    clear
    board[board.unmarked_keys.to_a.sample] = computer.marker
    display_board
  end

  def display_results
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? ('yes' or 'no')"
      answer = gets.chomp.downcase
      break if %w[yes y n no].include? answer

      puts "Sorry, must be 'yes' or 'no'"
    end

    %w[yes y].include? answer
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    clear
  end

  def display_board
    puts "Your an #{human.marker}. Computer is an #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
  end

  def human_turn?
    @current_player == 'human'
  end

  def alternate_current_player
    human_turn? ? @current_player = 'computer' : @current_player = 'human'
  end
end

game = TTTGame.new
game.play
