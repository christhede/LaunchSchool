require 'pry'

BEST_SCORE = 21
TOTAL_WINS = 5

@ranks = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
@suits = %w[Hearts Spades Diamonds Clubs]
@cards = []

@ranks.each do |rank|
  @suits.each do |suit|
    @cards << [rank, suit]
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def total_value(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum += if value == 'Ace'
             11
           elsif value.to_i.zero?
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > BEST_SCORE
  end

  sum
end

def blackjack?(value)
  value == BEST_SCORE
end

def busted?(value)
  value > BEST_SCORE
end

def cards_written_out(cards)
  if cards.flatten.count == 2
    cards.join(' of ')
  else
    cards.map { |card| card.join(' of ') }.to_s.gsub(/["\[\]]/, '')
  end
end

def dealers_cards_and_value
  prompt "Dealers cards: #{cards_written_out(@dealers_cards)}"
  prompt "Dealers cards value: #{dealers_hand_value}"
end

def players_cards_and_value
  prompt "Players cards: #{cards_written_out(@players_cards)}"
  prompt "Players cards value: #{players_hand_value}"
end

def shuffle_and_deal
  @cards.shuffle!
  @players_cards = @cards.shift(2)
  @dealers_cards = @cards.shift(2)
end

def dealers_hand_value
  total_value(@dealers_cards)
end

def players_hand_value
  total_value(@players_cards)
end

def detect_result
  if players_hand_value > BEST_SCORE
    :player_busted
  elsif dealers_hand_value > BEST_SCORE
    :dealer_busted
  elsif dealers_hand_value < players_hand_value
    :player
  elsif dealers_hand_value > players_hand_value
    :dealer
  else
    :tie
  end
end

def player_won?
  detect_result == :dealer_busted ||
  detect_result == :player
end

def dealer_won?
  detect_result == :player_busted ||
  detect_result == :dealer
end

def tie?
  detect_result == :tie
end

def display_result(dealer_cards, player_cards)
  result = detect_result

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer bust! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def footer(player_score, dealer_score)
  puts "-----------"
  puts "Players score: #{player_score}"
  puts "Dealers score: #{dealer_score}"
  puts 'First one to 5 wins the match'
  puts "-----------"
end

def hit_or_stay_header
  prompt "Dealers first card: #{cards_written_out(@dealers_cards[0])}"
  puts ""
  players_cards_and_value
end

def hit_or_stay_loop
  loop do
    system 'clear'
    hit_or_stay_header

    break if blackjack?(players_hand_value)

    sleep(1)
    prompt 'Hit or Stay?'
    @answer = gets.chomp
    break if ['hit', 'stay'].include?(@answer) ||
             busted?(players_hand_value)
    prompt 'That is not a valid answer'
    sleep(1)
  end
end

def players_turn
  loop do
    hit_or_stay_loop

    if @answer.casecmp?('Hit')
      prompt 'You chose to hit'
      @players_cards << @cards.shift
    else
      prompt 'You chose to stay'
    end
    sleep(1)
    system('clear')
    hit_or_stay_header

    break if blackjack?(players_hand_value) ||
             busted?(players_hand_value) ||
             @answer == 'stay'
  end
end

def dealers_turn
  loop do
    system 'clear'
    players_cards_and_value
    puts ""
    dealers_cards_and_value
    puts ""
    sleep(1)

    break unless dealers_hand_value < players_hand_value

    @dealers_cards << @cards.shift
    prompt 'Dealer hits'
    sleep(1)
  end
end

def new_game_pause
  puts 'New game starting'
  sleep(1)
  puts '.'
  sleep(1)
  puts '.'
  sleep(1)
  puts '.'
  sleep(1)
end

def adding_score(score)
  score += 1
end

player_score = 0
dealer_score = 0

system('clear')
prompt "Welcome to 21!"
sleep(1)

loop do
  loop do
    shuffle_and_deal

    players_turn
    dealers_turn unless busted?(players_hand_value) ||
                        blackjack?(players_hand_value)

    display_result(@dealer_cards, @players_cards)

    if player_won?
      player_score = adding_score(player_score)
    elsif dealer_won?
      dealer_score = adding_score(dealer_score)
    end
    binding.pry

    footer(player_score, dealer_score)

    break if player_score == TOTAL_WINS || dealer_score == TOTAL_WINS
    new_game_pause
  end

  loop do
    if player_score == TOTAL_WINS
      prompt "Player won the match!"
    else
      prompt "Dealer won the match!"
    end

    prompt "Would you like to play again? (Y or N)"
    @play_answer = gets.chomp
    break if @play_answer.downcase == 'n' || @play_answer.downcase == 'y'
    prompt "That's not a valid answer"
  end

  break if @play_answer.downcase == 'n'
end

prompt "Thanks for playing 21!"
