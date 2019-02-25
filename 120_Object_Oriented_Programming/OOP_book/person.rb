class Person
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def change_info(n)
    self.name = n
  end
end

bob = Person.new("Steve")
puts bob.name
bob.change_info("Bob")
puts bob.name


