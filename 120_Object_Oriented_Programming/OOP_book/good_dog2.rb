class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, w, h)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, w, h)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", "182 lbs", "300 cm")
puts sparky.info
sparky.change_info("Sparticus", "boobies", "butts")
puts sparky.info

# fido = GoodDog.new("Fido")
# puts fido.speak
