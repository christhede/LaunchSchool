class Cat
  AGE = 12

  def initialize(name)
    @name = name
  end
end

puts Cat::AGE

kitty = Cat.new('kitty')
puts kitty::AGE