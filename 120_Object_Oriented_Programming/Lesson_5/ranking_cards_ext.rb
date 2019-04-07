require 'pry'

class Card
  include Comparable

  VALUES = { 'Jack' => 11, 
             'Queen' => 12,
             'King' => 13,
             'Ace' => 14 }

  SUIT_VALUES = { 'Diamonds' => 1, 
                  'Clubs' => 2, 
                  'Hearts' => 3, 
                  'Spades' => 4 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if rank_value == other_card.rank_value
      suit_value <=> other_card.suit_value
    else
      rank_value <=> other_card.rank_value
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    VALUES.fetch(@rank, @rank)
  end

  def suit_value
    SUIT_VALUES.fetch(@suit, @suit)
  end
end

c1 = Card.new(2, 'Hearts')
c2 = Card.new(10, 'Diamonds')
c3 = Card.new('Ace', 'Clubs')
c4 = Card.new(5, 'Hearts')
c5 = Card.new(10, 'Spades')

puts c1 < c2
puts c2 < c3
puts c3 > c4
puts c4 < c5
puts c5 > c2
