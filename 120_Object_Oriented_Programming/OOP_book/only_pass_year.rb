class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
  attr_reader :number_of_doors

  def initialize(year, number_of_doors)
    super(year)
    @number_of_doors = number_of_doors
  end

  def four_doors?(number_of_doors)
    @number_of_doors == 4
  end
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

car1 = Car.new(2004, 4)
puts car1.year
puts car1.number_of_doors