class Meditator
  def initialize(hours)
    @hours = hours
  end

  def more_experienced?(other_person)
    hours > other_person.hours
  end

  protected
    attr_reader :hours  # We have made the accessor protected
end

m1 = Meditator.new 3000
m2 = Meditator.new 5000

puts m2.more_experienced? m1  # Output: => true
puts m1.more_experienced? m2  # Output: => false