PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
current_player = nil

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd) # rubocop:disable Metrics/AbcSize
  system("clear") || system("cls")
  prompt "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delim=', ', conj='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{conj} ")
  else
    arr[-1] = " #{conj} #{arr.last} "
    arr.join(delim)
  end
end

def place_piece!(board, current_player)
  if current_player == COMPUTER_MARKER
    computer_places_piece!(board)
  else
    player_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == COMPUTER_MARKER
    PLAYER_MARKER
  else
    COMPUTER_MARKER
  end
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def empty_square_in_line(brd, line)
  line.select do |num|
    brd.values_at(num) == [INITIAL_MARKER]
  end
end

def which_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = empty_square_in_line(brd, line)[0]
    end
  end
  square
end

def computer_places_piece!(brd)
  square =
    if which_square(brd, COMPUTER_MARKER)
      which_square(brd, COMPUTER_MARKER)
    elsif which_square(brd, PLAYER_MARKER)
      which_square(brd, PLAYER_MARKER)
    elsif empty_squares(brd).include?(5)
      5
    else
      empty_squares(brd).sample
    end
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

def valid_player_choice?(user_input)
  ['p', 'c', 'r'].include?(user_input)
end

def who_plays_first(*)
  who_plays = nil
  loop do
    prompt "Who goes first - Player(p), Computer(c), or Random(r)?"
    who_plays = gets.chomp.downcase
    break if valid_player_choice?(who_plays)
    prompt "That's not a valid choice. Please enter p, c, or r."
  end

  case who_plays
  when 'p'
    PLAYER_MARKER
  when 'c'
    COMPUTER_MARKER
  when 'r'
    [PLAYER_MARKER, COMPUTER_MARKER].sample
  end
end

loop do
  computer_score = 0
  player_score = 0
  draws = 0

  loop do
    system("clear") || system("cls")
    prompt "Welcome to tic-tac-toe. What's your name?"
    name = gets.chomp
    prompt "Hi #{name}! Let's see if you can beat the computer.
    The first to win 5 games wins the match!"
    loop do
      board = initialize_board
      current_player = nil
      prompt "The score is: #{name}: #{player_score},
      Computer: #{computer_score},
      Cats: #{draws}."
      current_player = who_plays_first
      loop do
        display_board(board)
        prompt "The score is: #{name}: #{player_score},
        Computer: #{computer_score},
        Cats: #{draws}."
        place_piece!(board, current_player)
        current_player = alternate_player(current_player)
        break if someone_won?(board) || board_full?(board)
      end

      display_board(board)

      if someone_won?(board)
        prompt "#{detect_winner(board)} won this round!"
      else
        prompt "It's a cat's game!"
      end

      if detect_winner(board) == "Player"
        player_score += 1
      elsif detect_winner(board) == "Computer"
        computer_score += 1
      else
        draws += 1
      end

      if player_score == 5
        prompt "#{name} won the match!"
        break
      elsif computer_score == 5
        prompt "Computer won the match!"
        break
      elsif draws == 5
        prompt "Cats win!"
        prompt "
            /\\___/\\
           ( o   o )
           (  =^=  )
           (        )
           (         )
           (          )))))))))))"
        break
      end
    end
    break
  end
  answer = nil
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt "That's not a valid response."
    end
  end
  break unless answer == 'y'
end

prompt "Thanks for playing Tic Tac Toe. Good bye!"