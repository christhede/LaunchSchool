require 'pry'

module Tools
  LINE_BREAK = '-----------------'

  def clear
    system('clear')
  end

  def prompt(message)
    puts "=> #{message}"
  end
end

module Hand
  include Tools
  def add_card_to_hand(card)
    cards << card
    update_total
  end

  def update_total
    update_array_of_values
    self.total = @array_of_values.sum
    subtract_ten if total > 21 && ace_count > 0
  end

  def update_array_of_values
    @array_of_values = nil
    @array_of_values = cards.map do |array|
      case array[0]
      when 'Jack'   then 10
      when 'Queen'  then 10
      when 'King'   then 10
      when 'Ace'    then 11
      else
        array[0].to_i
      end
    end
  end

  def ace_count
    cards.flatten.count 'Ace'
  end

  def subtract_ten
    ace_count.times do
      self.total -= 10
    end
  end

  def display_hand(first_card = nil)
    if first_card
      puts "#{self.name}'s top card:"
      prompt cards[0].join(' of ')
    else
      puts "#{self.name}'s cards:"
      cards.each { |card| prompt card.join(' of ') }
    end
    puts LINE_BREAK
  end

  def display_total(first_card = nil)
    if first_card
      puts "#{self.name}'s top card value: #{@array_of_values[0]}"
    else
      puts "#{self.name}'s hand value: #{total}"
    end
  end
end

class Participant
  include Hand
  include Tools

  attr_accessor :cards, :total, :name

  def initialize
    @total = 0
    @cards = []
    set_name
  end

  def busted?
    self.total > 21
  end

  def blackjack?
    self.total == 21
  end
end

class Player < Participant
  def set_name
    clear
    loop do
      prompt "What is your name?"
      self.name = gets.chomp.capitalize
      break unless name.empty?

      prompt "I'm sorry, but you must have a name!"
    end
  end
end

class Dealer < Participant
  def set_name
    self.name = ['Dealer Jim', 'Shoeless Joe', 'Alberta Bill'].sample
  end
end

class Deck
  attr_reader :of_cards

  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  SUITS = %w(Hearts Spades Diamonds Clubs)

  def initialize
    @of_cards = []
    create_deck
  end

  def create_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        @of_cards << [rank, suit]
      end
    end
  end
end

class TwentyOne
  include Tools

  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def main_gameplay
    clear
    display_welcome_message
    loop do
      game_reset
      deal_cards
      display_cards(0)
      player_turn unless dealer.blackjack?
      dealer_turn unless player.busted? || player.blackjack?
      display_results
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    prompt "Welcome to Twenty One, #{player.name}."
    prompt "I'm #{dealer.name}, I'll be your dealer today."
    sleep(1)
  end

  def game_reset
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    prompt "Dealing cards..."
    sleep(1)
    clear
    2.times { dealer.cards << deal_card }
    2.times { player.cards << deal_card }
  end

  def deal_card
    deck.of_cards.delete(deck.of_cards.sample) # deleting random card from deck and returning that card to hand
  end

  def update_total
    player.update_total
    dealer.update_total
  end

  def display_cards(first_card = nil)
    clear
    update_total
    player.display_hand
    dealer.display_hand(first_card)
    player.display_total
    dealer.display_total(first_card)
    puts LINE_BREAK
  end

  def player_turn
    return if player.blackjack?

    loop do
      prompt "Would you like to hit or stay?"
      player_responses
      break if (['stay', 's'].include? @player_response) || player.busted? || player.blackjack?

    end
    sleep(1)
  end

  def player_hit
    prompt "#{player.name} chose to hit"
    player.add_card_to_hand(deal_card)
    prompt "Dealing card..."
    sleep(1)
    display_cards(0)
  end

  def player_responses
    @player_response = gets.chomp.downcase
    if ['hit', 'h'].include? @player_response
      player_hit
    elsif ['stay', 's'].include? @player_response
      prompt "#{player.name} chose to stay"
    else
      prompt "That is not a valid answer. Please choose hit, or stay"
    end
  end

  def dealer_turn
    return if dealer.blackjack?

    until dealer.busted? || dealer.total >= 17 && dealer.total >= player.total
      dealer_hit
    end
  end

  def dealer_hit
    prompt "#{dealer.name} chose to hit"
    dealer.add_card_to_hand(deal_card)
    prompt "Dealing card..."
    sleep(1)
    display_cards(0)
  end

  def display_results
    display_cards
    if player.busted?
      prompt "#{player.name} busted!"
    elsif dealer.busted?
      prompt "#{dealer.name} busted!"
    elsif dealer.blackjack? && player.blackjack?
      prompt "It's a tie/push"
    elsif player.blackjack?
      prompt "#{player.name} Blackjack!"
    elsif dealer.blackjack?
      prompt "#{dealer.name} Blackjack!"
    else
      display_total_comparison
    end
    LINE_BREAK
  end

  def display_total_comparison
    if player.total == dealer.total
      prompt "It's a tie"
    elsif player.total > dealer.total
      prompt "#{player.name} won!"
    else
      prompt "#{dealer.name} won!"
    end
  end

  def play_again?
    @play_again_answer = nil
    loop do
      prompt "Would you like to play again? (yes or no)"
      @play_again_answer = gets.chomp
      break if ['yes', 'y', 'no', 'n'].include? @play_again_answer

      prompt "Sorry, that is not a valid answer"
    end
    prompt "Let's play again!" if ['yes', 'y'].include? @play_again_answer
    ['yes', 'y'].include? @play_again_answer
  end

  def display_goodbye_message
    prompt "Thanks for playing Twenty One #{player.name}!"
    prompt "Come back soon now."
    sleep(1)  
  end
end

TwentyOne.new.main_gameplay
