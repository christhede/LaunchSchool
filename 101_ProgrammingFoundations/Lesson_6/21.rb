require 'pry'

BEST_SCORE = 21
SAFETY_VALUE = 17

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
    if value == 'Ace'
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
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

def whose_won
  if dealers_hand_value > players_hand_value &&
     dealers_hand_value <= BEST_SCORE ||
     blackjack?(dealers_hand_value)

    game_score
    prompt 'Dealer won!'

  elsif players_hand_value > dealers_hand_value &&
        players_hand_value <= BEST_SCORE ||
        blackjack?(players_hand_value)

    game_score
    prompt 'Player won!'
  end
end

def game_score
  prompt "Players cards = #{players_hand_value}"
  prompt "Dealers cards = #{dealers_hand_value}"
end

def hit_or_stay_loop
  loop do
    prompt "Dealers first card: #{cards_written_out(@dealers_cards[0])}"
    puts ""
    players_cards_and_value
    puts ""

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

def end_of_turn(player)
  if blackjack?(player)
    prompt 'Blackjack!'

  elsif busted?(player)
    prompt 'Bust!'

  else
    prompt "You chose to stay" ? player == players_hand_value : "Dealer stays"
  end
end

def players_turn
  loop do
    system 'clear'
    hit_or_stay_loop

    if @answer.casecmp?('Hit')
      prompt 'You chose to hit'
      @players_cards << @cards.shift
      sleep(1)
      puts " "
    end

    break if blackjack?(players_hand_value) ||
             busted?(players_hand_value) ||
             @answer == 'stay'
  end

  end_of_turn(players_hand_value)

  sleep(1)
end

def dealers_turn
  loop do
    loop do
      system 'clear'
      players_cards_and_value
      puts ""
      dealers_cards_and_value
      puts ""
      sleep(1)

      break if blackjack?(dealers_hand_value) ||
               busted?(dealers_hand_value) ||
               (SAFETY_VALUE..BEST_SCORE).cover?(dealers_hand_value) &&
               players_hand_value < SAFETY_VALUE ||
               dealers_hand_value > players_hand_value

      @dealers_cards << @cards.shift
      prompt 'Dealer hits'
      sleep(1)
    end

    break if blackjack?(dealers_hand_value) ||
             busted?(dealers_hand_value) ||
             (SAFETY_VALUE..BEST_SCORE).cover?(dealers_hand_value)
  end

  end_of_turn(dealers_hand_value)
  sleep(1)
end

loop do
  system 'clear'
  prompt "Welcome to 21!"

  shuffle_and_deal

  players_turn
  dealers_turn unless busted?(players_hand_value) ||
                      blackjack?(players_hand_value)

  whose_won

  loop do
    prompt "Would you like to play again? (Y or N)"
    @play_answer = gets.chomp
    break if @play_answer.downcase == 'n' || @play_answer.downcase == 'y'
    prompt "That's not a valid answer"
  end

  break if @play_answer.downcase == 'n'
end

prompt "Thanks for playing 21!"
