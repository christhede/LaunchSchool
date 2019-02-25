class Cat
  attr_reader :name
  @@total_cats = 0

  def initialize
    @@total_cats += 1
  end

  def self.total
    @@total_cats
  end
end

kitty = Cat.new("Sophie")
kitty.greet