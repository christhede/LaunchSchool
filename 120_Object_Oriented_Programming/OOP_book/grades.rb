class Student
  attr_accessor :name

  def initialize(n, g)
    @name = n
    @grade = g  
  end

  def to_s
    "#{@name.capitalize} has a grade of #{@grade}"
  end

  def better_grade_than?(name)
    grade > name.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('joe', 90)
bob = Student.new('bob', 89)
# puts joe.grade

puts "Well done!" if joe.better_grade_than?(bob)
