# example:
class GoodDog
  DOG_YEARS = 7

  def initialize(n, a)
    @name = n
    @age = a
  end

  def human_years
    age * DOG_YEARS
  end

  private

  attr_accessor :name, :age
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.human_years # 28
puts sparky.name # Private method error
puts sparky.age # Private method error