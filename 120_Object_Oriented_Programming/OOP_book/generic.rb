class Cat
  def self.generic_greeting
    puts "I'm a cat!"
  end
end

kitty = Cat.new
kitty.class.generic_greeting