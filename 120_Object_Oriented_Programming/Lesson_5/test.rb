class Parent
end

#/////////////////////////////////////////////////////////////

class ChildOne < Parent
  def retrieve_deck?
    puts Game.deck
  end
end

#/////////////////////////////////////////////////////////////

class ChildTwo < Parent
end

#/////////////////////////////////////////////////////////////

class Deck
  attr_accessor :of_cards

  def initialize
    @of_cards = 'CARDS'
  end
end

#/////////////////////////////////////////////////////////////

class Game
  attr_accessor :child_one, :deck, :child_two

  def initialize
    @child_one = ChildOne.new
    @child_two = ChildTwo.new
    @deck = Deck.new
  end

  def start
    puts deck.of_cards
  end

  # def self.retrieve_deck
  #   puts 'okeydoke'
  # end
end

c = Game.new
c.start
