require 'pry'

module Tools
  def clear
    system('clear')
  end

  def prompt(message)
    puts "=> #{message}"
  end
end


class Participant
  attr_accessor :hand, :total
  attr_reader   :name

  def initialize(name)
    @total = 0
    @name = name
    @hand = []
  end

  def add_card_to_hand(card)
    self.hand << card
    update_total
  end

  def busted?
    self.total > 21
  end

  def blackjack?
    self.total == 21
  end

  def update_total
    update_hand_value
    subtract_nine if self.total > 21 && ace_count > 0
  end

  def update_hand_value
    self.total = hand.map do |array|
      case array[0]
      when 'Jack'   then 10
      when 'Queen'  then 10
      when 'King'   then 10
      when 'Ace'    then 10
      else 
        array[0].to_i
      end
    end.sum
  end

  def ace_count
    hand.flatten.count 'Ace'
  end

  def subtract_nine
    ace_count.times do 
      self.total -= 9
    end
  end
end

class Player < Participant
end

class Dealer < Participant
end

class Deck
  attr_reader :of_cards

  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  SUITS = %w[Hearts Spades Diamonds Clubs]

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

  LINE_BREAK = '-----------------'
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new('Chris')
    @dealer = Dealer.new('Dealer Jim')
  end

  def start
    clear
    display_welcome_message
    deal_cards
    display_cards
    player_turn
    dealer_turn unless player.busted? || player.blackjack?
    show_results
  end

  def choose_player_name
    prompt "What is your name?"
    gets.chomp.capitalize
  end

  def display_welcome_message
    prompt "Welcome to Twenty One #{player.name}."
    # sleep(1)
  end

  def deal_card
    deck.of_cards.delete(deck.of_cards.sample)
  end

  def deal_cards
    prompt "Dealing cards..."
    # sleep(1)
    clear
    2.times {dealer.hand << deal_card}
    2.times {player.hand << deal_card}
  end

  def update_total
    player.update_total
    dealer.update_total
  end

  def display_cards
    clear
    update_total
    prompt "#{player.name} is holding #{joinand(player.hand)}"
    prompt "#{dealer.name} is showing #{joinand(dealer.hand[0])}"
    puts LINE_BREAK
    prompt "#{player.name} hand total: #{player.total}"
    prompt "#{dealer.name} top card total: #{dealer.hand[0][0]}"
    puts LINE_BREAK
  end

  def display_final_flop
    clear
    update_total
    prompt "Final flop:"
    prompt "#{player.name} is holding #{joinand(player.hand)}."
    prompt "#{dealer.name} is holding #{joinand(dealer.hand)}."
    puts LINE_BREAK
    prompt "#{player.name} hand total: #{player.total}"
    prompt "#{dealer.name} hand total: #{dealer.total}"
    puts LINE_BREAK
  end

  def joinand(array)
    # binding.pry
    if array.flatten.size == 4
      array.map {|card| "a #{card.join(' of ')}"}.join(' and ')
    elsif array.flatten.size == 2
      "a #{array.join(' of ')}"
    else
      array.map { |card|
        if card == array.last
          "and a #{card.join(' of ')}"
        else
          "a #{card.join(' of ')}, "
        end
      }.join
    end
  end

  def player_turn
    loop do
      prompt "Would you like to hit or stay?"
      answer = gets.chomp.downcase
      if player.total == 21
        prompt "Blackjack!"
      elsif ['hit', 'h'].include? answer
        player_hit
      elsif ['stay', 's'].include? answer
        prompt "#{player.name} chose to stay"
      else
        prompt "That is not a valid answer. Please choose hit, or stay"
      end

      break if answer == 'stay' || player.busted? || player.blackjack?
    end
    sleep(1)
  end

  def player_hit
    prompt "#{player.name} chose to hit"
    player.add_card_to_hand(deal_card)
    display_cards
  end

  def dealer_turn
    clear
    display_cards
    unless dealer.busted? || dealer.total >= 17 && dealer.total >= player.total
      dealer_hit
    end
  end

  def dealer_hit
    prompt "#{dealer.name} chose to hit"
    dealer.add_card_to_hand(deal_card)
    sleep(1)
  end

  def show_results
    display_final_flop
    if player.busted?
      prompt "#{player.name} busted!"
    elsif dealer.busted?
      prompt "#{dealer.name} busted!"
    elsif player.blackjack?
      prompt "#{player.name} Blackjack!"
    elsif dealer.blackjack?
      prompt "#{dealer.name} Blackjack!"
    else
      total_comparison
    end
  end

  def total_comparison
    if player.total == dealer.total
      prompt "It's a tie"
    elsif player.total > dealer.total
      prompt "#{player.name} won!"
    else
      prompt "#{dealer.name} won!"
    end
  end
end

TwentyOne.new.start