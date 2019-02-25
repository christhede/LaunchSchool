class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s 
    "I'm #{@name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty