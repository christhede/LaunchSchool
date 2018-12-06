# loop do
#   display_board(board)
#   place_piece!(board, current_player)
#   current_player = alternate_player(current_player)
#   break if someone_won?(board) || board_full?(board)
# end

def alternate_player(current_player)
  if current_player == 'computer'
    puts 'player'
  else 
    puts 'computer'
  end
end

current_player = alternate_player('player')