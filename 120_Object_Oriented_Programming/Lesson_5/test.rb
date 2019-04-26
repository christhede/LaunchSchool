class Cat
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def >(other)
    self.num > other.num
  end

  def ==(other)
    self.num == other.num
  end

end

kitty = Cat.new(3)
rufus = Cat.new(2)

puts kitty == rufus
puts kitty.num != rufus.num