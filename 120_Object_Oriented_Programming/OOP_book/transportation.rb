module Towable
  def tow
    'I can tow a trailer!'
  end
end

module Transportation
  class Vehicle
    attr_reader :year
  
    def initialize(year)
      @year = year
    end

  end

  class Truck < Vehicle
    include Towable
  end

  class Car < Vehicle
  end
end

truck1 = Transportation::Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Transportation::Car.new(2006)
puts car1.year