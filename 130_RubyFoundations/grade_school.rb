# store students names, along with what grade they are in. 
# add students to the school along with their grade. 

class School
  attr_reader :school

  def initialize
    @school = {}
  end

  def add(name, grade)
    @school[grade].nil? ? @school[grade] = [name] : @school[grade] << name
  end

  def grade(grade)
    @school[grade].nil? ? [] : @school[grade]
  end 

  def to_h
    @school.sort.map {|k, v| [k, v.sort] }.to_h
  end
end

ding = School.new
ding.add('Jennifer', 2)
ding.add('Chris', 2)
ding.add('Bing', 8)
ding.add('Darrel', 3)
ding.add('Lisa', 4)
p ding.to_h
