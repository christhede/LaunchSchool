class Person
  def name=(string)
    @first_name = string.split[0]
    @last_name = string.split[1]
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name