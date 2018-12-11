require 'pry'

@deck = [%w(2 3 4 5 6 7 8 9 10 Jack Queen King),
         %w(Hearts Spades Diamonds Clubs)]

def random_card
  [@deck[0].sample, @deck[1].sample]
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
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(value)
  value > 21
end

@players_cards = random_card, random_card
@dealers_cards = random_card, random_card

def cards_written_out(cards)
  cards.map {|card| card.join(' of ')}
end

def players_turn
  system 'clear'
  loop do
    prompt "Players cards: #{cards_written_out(@players_cards)}"
    prompt "Total value: #{total_value(@players_cards)}"

    prompt 'Hit or Stay?'
    @answer = gets.chomp
    @players_cards << random_card if @answer.casecmp?('hit')
    break if @answer.casecmp?('stay') || busted?(total_value(@players_cards))
  end

  if busted?(total_value(@players_cards))
    prompt 'Bust!'
  else
    prompt 'You chose to stay!'
  end

  prompt @players_cards
  prompt total_value(@players_cards)
end

def dealers_turn
  prompt "Dealers cards: #{cards_written_out(@dealers_cards)}"
  prompt "Total value: #{total_value(@dealers_cards)}"

  loop do
    if busted?(total_value(@dealers_cards))
      prompt 'Dealer bust!'
      break
    elsif total_value(@dealers_cards) == (17..21)
      prompt 'Dealer stays'
      break
    else 
      prompt 'Dealer hits'
      @dealers_cards << random_card
    end
  end

  prompt "Dealers cards: #{cards_written_out(@dealers_cards)}"
  prompt "Total value: #{total_value(@dealers_cards)}"
end

players_turn
dealers_turn




