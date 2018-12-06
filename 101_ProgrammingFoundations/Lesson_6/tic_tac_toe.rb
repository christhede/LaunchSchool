require 'pry'

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

# rubocop:disable Metrics/MethodLength,
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
# rubocop:enable Metrics/Length

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

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
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
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

def header
  system 'clear'
  prompt "You're a #{PLAYER_MARKER}. The computer is #{COMPUTER_MARKER}"
  prompt 'First one to 5 wins the match'
  if @player_score > 0 || @computer_score > 0
    prompt whose_winning?(@player_score, @computer_score)
  end
  display_board(@board)
end

def alternate_player(player)
  if player == 'Computer'
    'Player'
  else 
    'Computer'
  end
end

def place_piece!(brd, player)
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

loop do
  loop do
  system 'clear'
  prompt 'Who should go first?'
  prompt "Please choose one: 'Player', 'Computer' or 'Random'"
  answer = gets.chomp
    if answer.downcase.start_with?('r')
      num = array.sample
      answer = num == 1 ? 'Player' : 'Computer'
    end

    if answer.downcase.start_with?('p')
      @current_player = 'Player'
      break
    elsif answer.downcase.start_with?('c')
      @current_player = 'Computer'
      break
    else
      prompt 'That is not a valid answer'
      sleep(1)
    end
  end
  winner = []
  loop do

    @board = initialize_board
    display_board(@board)
    @current_player = winner.pop
    binding.pry

    array = [1, 2]
    loop do
      loop do 
        place_piece!(@board, @current_player)
        @current_player = alternate_player(@current_player)
        break if someone_won?(@board) || board_full?(@board)
      end
      break if someone_won?(@board) || board_full?(@board)
    end

    header

    if someone_won?(@board)
      prompt "#{detect_winner(@board)} won!"
      if detect_winner(@board) == 'Player'
        @player_score += 1
      elsif detect_winner(@board) == 'Computer'
        @computer_score += 1
      end
      break if @player_score == 5 || @computer_score == 5
      prompt whose_winning?(@player_score, @computer_score)
    else
      prompt "It's a tie #{game_score}"
    end
    new_game_pause
    winner << detect_winner(@board)
    binding.pry
  end

  prompt "The #{detect_winner(@board)} won the match! #{game_score}"
  prompt 'Do you want to play again? (Y or N)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Catch ya later.'
