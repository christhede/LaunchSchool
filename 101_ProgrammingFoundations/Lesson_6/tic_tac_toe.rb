require 'pry'

$player_score = 0
$computer_score = 0
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def header
  system 'clear'
  prompt "You're a #{PLAYER_MARKER}. The computer is #{COMPUTER_MARKER}"
  prompt 'First one to 5 wins the match'
  if $player_score > 0 || $computer_score > 0
    prompt "#{whose_winning?($player_score, $computer_score)}"
  end
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
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

def joinor(num, punc = ', ', op = 'or ')
  if num.count <= 2
    puts num.join(" #{op}")
  else
    puts num.join(punc.to_s).insert(-2, op)
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

def new_game_pause
  puts "New game starting"
  sleep(0.75)
  puts '.'
  sleep(0.75)
  puts '.'
  sleep(0.75)
  puts '.'
  sleep(0.75)
end

loop do
  board = initialize_board
  loop do
    board = initialize_board
    loop do
      header
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      prompt "#{whose_winning?($player_score, $computer_score)}"
    end

    header
    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
       if "#{detect_winner(board)}" == 'Player'
         $player_score += 1
       elsif "#{detect_winner(board)}" == 'Computer'
         $computer_score += 1
       end
      prompt "#{whose_winning?($player_score, $computer_score)}"
    else
      prompt "It's a tie #{$player_score}-#{$computer_score}"
    end

    if $player_score == 2 || $computer_score == 2
      break
    else
      new_game_pause
    end
  end
  # binding.pry
  prompt "The #{detect_winner(board)} won the match! #{$player_score}-#{$computer_score}"
  prompt 'Do you want to play again? (Y or N)'
  $player_score = 0
  $computer_score = 0
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe. Goodbye'
