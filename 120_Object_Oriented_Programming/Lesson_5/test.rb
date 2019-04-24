class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

giraffe = Animal.new
# puts giraffe.a_protected_method
puts giraffe.a_public_method