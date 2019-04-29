module Vacationable
  def take_vacation
    "We take vacation!"
  end
end

module Delegatable
  def delegate
    "We can delegate!"
  end
end

class EmployeeManagementApplication
  attr_reader :name, :ser_num, :position
  attr_accessor :vacation_days, :desk

  def initialize(name, ser_num)
    @name = name
    @ser_num = ser_num
    @position = self.class
  end

  def to_s
    puts "Name: #{name}"
    puts "Type: #{position}"
    puts "Serial Number: #{ser_num}"
    puts "Vacation Days: #{vacation_days}"
    "Desk: #{desk}"
  end
end

class Executive < EmployeeManagementApplication
  include Vacationable
  include Delegatable

  def initialize(name, ser_num)
    super(name, ser_num)
    @desk = "corner office"
    @vacation_days = 20
  end
end

class Manager < EmployeeManagementApplication
  include Vacationable
  include Delegatable

  def initialize(name, ser_num)
    super(name, ser_num)
    @desk = "private office"
    @vacation_days = 14
  end
end

class RegularEmployee < EmployeeManagementApplication
  include Vacationable

  def initialize(name, ser_num)
    super(name, ser_num)
    @desk = "cubicle"
    @vacation_days = 10
  end
end

class PartTimeEmployee < EmployeeManagementApplication
  def initialize(name, ser_num)
    super(name, ser_num)
    @desk = "open office space"
    @vacation_days = 0
  end
end

# test cases
dave = Executive.new("Dave", 123456789)
puts dave
# Name: Dave
# Type: Executive
# Serial Number: 123456789
# Vacation Days: 20
# Desk: corner office
puts dave.take_vacation # "We take vacation!"
puts dave.delegate # "We can delegate!"

jon = Manager.new("Jon", 987654321)
puts jon
# Name: Jon
# Type: Manager
# Serial Number: 987654321
# Vacation Days: 14
# Desk: private office
puts jon.take_vacation # "We take vacation!"
puts jon.delegate # "We can delegate!"

chris = RegularEmployee.new("Chris", 5678910)
puts chris
# Name: Chris
# Type: RegularEmployee
# Serial Number: 5678910
# Vacation Days: 10
# Desk: cubicle
puts chris.take_vacation # "We take vacation!"
puts chris.delegate # Not able to delegate - undefined method error

jim = PartTimeEmployee.new("Jim", 123)
puts jim
# Name: jim
# Type: PartTimeEmployee
# Serial Number: 123
# Vacation Days: 0
# Desk: open office space
puts jim.take_vacation # Not able to take vacation - undefined method error.
puts jim.delegate # Not able to delegate - undefined method error


