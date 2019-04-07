require 'pry'

class Deck
  attr_accessor :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    reset
  end

  def reset
    RANKS.map do |rank|
      SUITS.map do |suit|
        cards << Card.new(rank, suit)
      end
    end
  end

  def draw
    if @cards.empty?
      fill_deck
    else
      cards.sample
    end
  end
end

class Card
  include Comparable

  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(@rank, @rank)
  end
end

deck = Deck.new
drawn = []
puts 52.times { drawn << deck.draw }
puts drawn
puts drawn.count { |card| card.rank == 5 } # == 4
puts drawn.count { |card| card.suit == 'Hearts' } # == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.