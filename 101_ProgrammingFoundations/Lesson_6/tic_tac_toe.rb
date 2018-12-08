# rubocop:disable Metrics/AbcSize,
# rubocop:disable Metrics/MethodLength,
# rubocop:disable Metrics/BlockLength,
# rubocop:disable Metrics/CyclomaticComplexity

@player_score = 0
@computer_score = 0
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def board_with_numbers
  puts ''
  puts '     |     |'
  puts '  1  |  2  |  3 '
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts '  4  |  5  |  6  '
  puts '     |     |'
  puts '-----+-----+------'
  puts '     |     |'
  puts '  7  |  8  |  9  '
  puts '     |     |'
  puts ''
end

def display_board(brd)
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+------'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def header
  system 'clear'
  prompt "You're an '#{PLAYER_MARKER}'. The computer is an '#{COMPUTER_MARKER}'"
  prompt 'First one to 5 wins the match'
  if @player_score > 0 || @computer_score > 0
    prompt whose_winning?(@player_score, @computer_score)
    prompt 'The winner plays first'
  end
  display_board(@board)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# rubocop: disable Metrics/LineLength
def find_at_risk_square(line, board, marker)
  board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first if board.values_at(*line).count(marker) == 2
end
# rubocop: enable Metrics/LineLength

def joinor(num, punc = ', ', op = 'or ')
  if num.count <= 2
    num.join(" #{op}")
  else
    num.join(punc.to_s).insert(-2, op)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !detect_winner(brd).nil?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  unless square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  unless square
    square = 5 if brd[5] == INITIAL_MARKER
  end

  square = empty_squares(brd).sample unless square

  brd[square] = COMPUTER_MARKER
end

def player_places_piece!(brd)
  square = ''
  loop do
    if empty_squares(brd).count == 1
      square = empty_squares(brd).pop
    else
      prompt "Choose a square and hit enter: #{joinor(empty_squares(brd))}"
      square = gets.chomp.to_i
    end
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def whose_winning?(num1, num2)
  if num1 > num2
    "The player is winning #{num1}-#{num2}"
  elsif num2 > num1
    "The computer is winning #{num2}-#{num1}"
  else
    "It's a tie #{num1}-#{num2}"
  end
end

def game_score
  if @player_score >= @computer_score
    "#{@player_score}-#{@computer_score}"
  else
    "#{@computer_score}-#{@player_score}"
  end
end

def new_game_pause
  puts 'New game starting'
  sleep(0.75)
  puts '.'
  sleep(0.75)
  puts '.'
  sleep(0.75)
  puts '.'
  sleep(0.75)
end

def alternate_player(player)
  if player == 'Computer'
    'Player'
  else
    'Computer'
  end
end

def place_piece!(_, player)
  if player == 'Computer'
    header
    sleep(1)
    computer_places_piece!(@board)
  else
    header
    sleep(1)
    player_places_piece!(@board)
  end
end

def initial_gameplay
  loop do
    array = %w(Player Computer)
    system 'clear'
    prompt 'This is how the board numbering works:'
    board_with_numbers
    prompt 'Who should go first?'
    prompt "Please choose one and hit enter: 'Player', 'Computer' or 'Random'"
    @answer = gets.chomp

    if @answer.downcase.start_with?('r')
      num = array.sample
      @answer = num == 'Player' ? 'Player' : 'Computer'
    end

    if @answer.downcase.start_with?('p')
      @current_player = 'Player'
      break
    elsif @answer.downcase.start_with?('c')
      @current_player = 'Computer'
      break
    else
      prompt 'That is not a valid answer'
      sleep(1)
    end
  end
end

loop do
  initial_gameplay

  loop do
    @board = initialize_board
    display_board(@board)

    loop do
      place_piece!(@board, @current_player)
      @current_player = alternate_player(@current_player)
      break if someone_won?(@board) || board_full?(@board)
    end

    header

    if someone_won?(@board)
      prompt "#{detect_winner(@board)} won!"
      if detect_winner(@board) == 'Player'
        @player_score += 1
        @current_player = 'Player'
      elsif detect_winner(@board) == 'Computer'
        @computer_score += 1
        @current_player = 'Computer'
      end
      break if @player_score == 5 || @computer_score == 5
      prompt whose_winning?(@player_score, @computer_score)
    else
      prompt "It's a tie."
    end
    new_game_pause
  end

  prompt "The #{detect_winner(@board)} won the match! #{game_score}"
  @player_score = 0
  @computer_score = 0
  loop do
    prompt 'Do you want to play again? (Y or N)'
    @last_answer = gets.chomp
    break if @last_answer.downcase.start_with?('y', 'n')
    prompt "That's not a valid answer"
  end
  break if @last_answer.downcase.start_with?('n')
end

# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

prompt 'Thanks for playing Tic Tac Toe! Catch ya later.'
