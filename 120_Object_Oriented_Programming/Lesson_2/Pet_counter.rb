class Shelter
  attr_reader :adoptions
  
  def initialize
    @adoptions = []
  end
    
  def adopt(owner, pet)
    @adoptions << "#{owner} has adopted #{pet}"
    owner.add_to_pet_counter
  end
  
  def print_adoptions
    puts @adoptions
  end
end

class Pet
  attr_reader :breed, :name
  
  def initialize(breed, name)
    @breed = breed
    @name = name
  end
  
  def to_s
    @name
  end
end

class Owner
  attr_accessor :number_of_pets, :name
  
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
  
  def add_to_pet_counter
    @number_of_pets += 1
  end
  
  def to_s
    @name
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
