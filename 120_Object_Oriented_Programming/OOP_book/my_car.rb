class Vehicle
  attr_accessor :color, :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m, s)
    self.year = y
    self.color = c
    self.model = m
    @current_speed = s
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(distance, fuel)
    mileage = distance / fuel
    "This car gets #{mileage.ceil(2)} km/L of per tank."
  end

  def speed_up(num)
    @current_speed += num
    "You push the gas and accelerate #{num} mph."
  end

  def brake(num)
    @current_speed -= num
    "You push the brake and decelerate #{num} mph."
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def current_speed
    "You are now going #{@current_speed} mph."
  end

  def spray_paint(color)
    self.color = color
    "You new #{color} paint job looks great!"
  end

  def change_year(new_year)
    year = new_year
  end

  def shut_down
    "Let's park this bad boy!"
  end

  def age
    private_method
  end

  private

  def private_method
    Time.now.year - self.year
  end
end

module GoFast
  def goes_fast
    "Holy shit slow down"
  end
end

class MySaloonCar < Vehicle
  NUMBER_OF_DOORS = 4
  include GoFast

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

# otis = MySaloonCar.new(1992, 'Burgundy', 'e34 BMW', 0)
# # puts MyCar.what_am_i

# branda = MyTruck.new(2004, "silver", "Ford Ranger", 0)

lumina = MySaloonCar.new(2004, 'white', 'chevy lumina', 0)
# puts lumina.speed_up(20)
# puts lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# MySaloonCar.gas_mileage(13, 351)
# lumina.spray_paint("red")
# lumina.change_year(2009)
puts lumina.age