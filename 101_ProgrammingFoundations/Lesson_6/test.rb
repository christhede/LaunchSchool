player_score = 0
dealers_score = 0

def dealers_hand_value
  18
end

def players_hand_value
  20
end

def adding_score(score)
  score += 1
end

def player_won?
  dealers_hand_value > 21 ||
  dealers_hand_value < players_hand_value
end

def dealer_won?
  dealers_hand_value > players_hand_value ||
  players_hand_value > 21
end

def game_score
  puts "-----------"
  # puts "Players score: #{player_score}"
  # puts "Dealers score: #{dealers_score}"
end


if player_won?
  player_score = adding_score(player_score)
elsif dealer_won?
  dealer_score = adding_score(dealer_score)
end

puts player_score
puts dealers_score