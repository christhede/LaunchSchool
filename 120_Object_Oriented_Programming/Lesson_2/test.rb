module Choices
  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end
end

class Scissors
  include Choices


  def >(other_move)
    other_move.paper?) ||
    other_move.lizard?)
  end
end