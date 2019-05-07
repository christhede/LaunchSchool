# lexical scope and constants:
# constants have lexical scope which means the constant remains defined to where it was initialized in the code. 
# If it is called in a class, it will stay within that class. You can call constants from outside of the class with
# class::CONSTANT.  



class Vehicle
  WHEELS = 18
end

class Car < Vehicle
  WHEELS = 4

  def number_of_wheels
    "#{WHEELS}"
  end
end

class Motorcycle < Vehicle
  WHEELS = 2

  def number_of_wheels
    "#{WHEELS}"
  end
end


vehicles = [Car.new, Motorcycle.new]

vehicles.each do |vehicle|
  puts vehicle.number_of_wheels
end

puts Vehicle::WHEELS