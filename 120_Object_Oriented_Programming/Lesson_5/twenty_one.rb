require 'pry'

module Tools
  BLACKJACK = 21
  LINE_BREAK = '-----------------'

  def clear
    system('clear')
  end

  def prompt(message)
    puts "=> #{message}"
  end
end

module Displayable
  include Tools

  def display_welcome_message
    prompt "Welcome to Twenty One, #{player.name}."
    prompt "I'm #{dealer.name}, I'll be your dealer today."
    sleep(1)
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

  def display_results
    display_cards
    if game_end?
      display_if_busted || display_if_blackjack
    else
      display_total_comparison
    end
    LINE_BREAK
  end

  def game_end?
    player.busted? ||
      player.blackjack? ||
      dealer.busted? ||
      dealer.blackjack?
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

  def display_if_busted
    if player.busted?
      prompt "#{player.name} busted!"
    elsif dealer.busted?
      prompt "#{dealer.name} busted!"
    end
  end

  def display_if_blackjack
    if dealer.blackjack? && player.blackjack?
      prompt "It's a tie/push"
    elsif player.blackjack?
      prompt "#{player.name} Blackjack!"
    elsif dealer.blackjack?
      prompt "#{dealer.name} Blackjack!"
    end
  end

  def display_goodbye_message
    prompt "Thanks for playing Twenty One #{player.name}!"
    prompt "Come back soon now."
    sleep(1)
  end
end

module Hand
  include Tools

  def add_card_to_hand(card)
    cards << card
    update_total
  end

  def reset_hand
    @array_of_values = []
  end

  def update_total
    update_array_of_values
    self.total = @array_of_values.sum
    subtract_ten if total > BLACKJACK && ace_count > 0
  end

  def update_array_of_values
    @array_of_values = cards.map do |array|
      case array[0]
      when 'Jack'   then 10
      when 'Queen'  then 10
      when 'King'   then 10
      when 'Ace'    then 11
      else
        array.first.to_i
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
      puts "#{name}'s top card:"
      prompt cards[0].join(' of ')
    else
      puts "#{name}'s cards:"
      cards.each { |card| prompt card.join(' of ') }
    end
    puts LINE_BREAK
  end

  def display_total(first_card = nil)
    if first_card
      puts "#{name}'s top card value: #{@array_of_values[0]}"
    else
      puts "#{name}'s hand value: #{total}"
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
    self.total > BLACKJACK
  end

  def blackjack?
    self.total == BLACKJACK
  end

  def hit(card)
    prompt "#{name} chose to hit"
    add_card_to_hand(card)
    prompt "Dealing card..."
    sleep(1)
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

  def hit_or_stay
    loop do
      prompt "Would you like to hit or stay?"
      @answer = gets.chomp.downcase
      break if hit? || stay?

      prompt "That is not a valid answer. Please choose hit, or stay"
    end
    @answer
  end

  def hit?
    ['hit', 'h'].include? @answer
  end

  def stay?
    ['stay', 's'].include? @answer
  end
end

class Dealer < Participant
  def set_name
    self.name = ['Dealer Jim', 'Shoeless Joe', 'Alberta Bill'].sample
  end
end

class Deck
  attr_accessor :of_cards

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

  # deleting random card from deck and returning that card
  def deal_card
    of_cards.delete(of_cards.sample)
  end
end

class TwentyOne
  include Tools
  include Displayable

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
      deal_initial_hand
      display_cards(0)
      player_turn unless dealer.blackjack?
      dealer_turn unless player.busted? || player.blackjack?
      display_results
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def game_reset
    player.cards = []
    dealer.cards = []
    player.reset_hand
    dealer.reset_hand
    deck.of_cards = []
    deck.create_deck
  end

  def deal_initial_hand
    prompt "Dealing cards..."
    sleep(1)
    clear
    2.times { dealer.cards << deck.deal_card }
    2.times { player.cards << deck.deal_card }
  end

  def update_total
    player.update_total
    dealer.update_total
  end

  def player_turn
    return if player.blackjack?

    loop do
      player.hit_or_stay
      if player.hit?
        player.hit(deck.deal_card)
      else
        prompt "#{player.name} chose to stay"
      end
      break if player.stay? || player.busted? || player.blackjack?

      display_cards(0)
    end
    sleep(1)
  end

  def dealer_turn
    return if dealer.blackjack?

    until dealer.busted? || dealer.total >= 17 && dealer.total >= player.total
      dealer.hit(deck.deal_card)
    end
  end

  def play_again?
    @play_again_answer = nil
    loop do
      prompt "Would you like to play again? (yes or no)"
      @play_again_answer = gets.chomp.downcase
      break if ['yes', 'y', 'no', 'n'].include? @play_again_answer

      prompt "Sorry, that is not a valid answer"
    end
    prompt "Let's play again!" if ['yes', 'y'].include? @play_again_answer
    ['yes', 'y'].include? @play_again_answer
  end
end

TwentyOne.new.main_gameplay
