# require 'pry'
# class Randomizer

#   def initialize(input)
#     @arr = input
#     @sums = []
#     @arr.each_with_index { |x, i| @sums << (@sums.last || 0) + @arr[i][:pct] }
#     binding.pry
#   end

#   def draw
#     rand = Random.rand()

#     for i in 1..(@sums.length)
#       return @arr[i][:word] if rand <= @sums[i]
#     end
#   end
# end

class Randomizer
  attr_accessor :array_of_moves

  def initialize(array)
    @array_of_moves = array
  end

  def change_value(name, pct)
    @@new_pct = (1-pct)/4.0
    @@exempt_name = name
    self.array_of_moves[name] = pct
    change_other_percentages
  end

  def change_other_percentages
    self.array_of_moves.keys.map { |word| array_of_moves[word] = @@new_pct unless word == @@exempt_name}
  end
end


list = Randomizer.new({'rock' => 0.20, 'paper' => 0.20, 'scissors' => 0.20, 'spock' => 0.20, 'lizard' => 0.20})

puts list.array_of_moves
puts list.change_value('rock', 0.45)
puts list.array_of_moves