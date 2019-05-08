class Cat
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def ==(other)
    self.age == other.age
  end

  def >(other)
    self.age > other.age
  end
end

kitty = Cat.new(8)

felix = Cat.new(12)

puts felix > kitty
