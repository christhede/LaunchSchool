require 'pry'


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
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new('chris')
    @dealer = Dealer.new('Dealer Jim')
  end

  def start
    deal_cards
    show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  def choose_player_name
    puts "What is your name?"
    gets.chomp.capitalize
  end

  def deal_card
    deck.of_cards.delete(deck.of_cards.sample)
  end

  def deal_cards
    2.times {dealer.hand << deal_card}
    2.times {player.hand << deal_card}
    player.update_total
  end

  def show_initial_cards
    puts "#{player.name} has a #{player.hand}"
    # puts "#{player.name} has a #{join(player.hand[0])} and a #{join(player.hand[1])}"
    puts "#{dealer.name} is showing a #{join(dealer.hand[0])}"
    # player.update_total
    p player.total
  end

  def join(array)
    array.join(' of ')
  end

  def player_turn
    puts "Would you like to hit or stay?"
    answer = gets.chomp.downcase
    if player.busted?
      puts "#{player.name} bust!"
    elsif answer == 'hit'
      player.add_card_to_hand(deal_card)
    else
      puts "#{player.name} chose to hit"
    end
  end

  def dealer_turn
    if dealer.busted?
      puts "Dealer busted!"
    elsif dealer.hand >= 17
      puts "#{dealer.name} chose to stay"
    else
      puts "#{dealer.name} chose to hit"
      dealer.add_card_to_hand(deal_card)
    end
  end
end

TwentyOne.new.start