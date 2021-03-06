What is OOP used for?
We use obect oriented programming techinques to seperate chunks of data into manageable pieces, and that if one functionality breaks,
it doesnt break the entire code. Much easier to manage. It also allows the programmer to think in another layer of abstraction becuase
we use verbs and nouns for naming our methods. 

Encapsulation: is hiding pieces of functionality and making it unaccessable to outside the method, using the 'private' and 'protected' keywords.
It is a form of data protection.
The privte keyword makes the code hidden by it, only accessible to the method in which it resides, you cannot call a method under the 'private' keyword.
It will return a NoMethodError. If you do need to use a method, but keep it hidden from outside of the object, you can use the 'protected' keyword.
 
# example: 

# ________________________________________________


Relationships: in Ruby:
Two types of relationships are:
'Assossiation' can be thought of as a 'has-a' relationship. # A Library, HAS books
'Inheritance' can be thought of as an 'is-a' relationship. # An atlas IS A book

# ________________________________________________

Collaboration: is a way of modelling relationships betweeen differnt objects. Collaboration is a relatinship by assossitation - not of inheritance.
1. Collaborator objects can be of any type: Custom class object, hash, array, string, integer etc. 
2. Collaborator objects are always part of another objects state. 

# ________________________________________________

Polymorphism: is the ability for data to be represented as many types. Using pre-written code for multipe purposes. 
Inheritance and mixins are two ways in ruby to achieve polymorphism. 

# ________________________________________________

Classes: Classes define objects. 
You define a class by the 'class' keyword. 

# example of defining a class
class Cat; end

# ________________________________________________

Objects: Everything in ruby is an object. We use classes to create objects. Objects are a way of holding the information from a class. 
You can find out what class an object is assigned to with the ::class method. Some objects will hold different information than another object,
eventhough they are instances of the same class.

# creating an object:
kitty = Cat.new

kitty.class # <- returns the class in which 'kitty' called from

# ________________________________________________

Mixin: a way to add in behaviours to a class, with the Module class. Usually if the behaviours can be used accross multiple Classes.
They also use the 'has a' relationship with the class objects. You cannot create an object within a module. 

# example
module Speakable
  def speak
    puts 'meow'
  end
end

# ________________________________________________

States: Tracks attributes for individual objects. Objects can have the same behaviours, but not the same states. States are created
when instantiating an object. Can be different for each object. Instance variables keep track of state.

# example:
class Cat
  def initialize(name)
    @name = name # <- Instance variables keep track of state
  end

  def speak
    "#{@name} meows"
  end
end

# ________________________________________________

Behaviours: Are what objects are capable of doing.

# example:
class Cat
  def initialize(name)
    @name = name
  end

  def speak # <- Instance methods expose behaviour for objects
    "#{@name} meows"
  end
end

felix = Cat.new('Felix')
kitty = Cat.new('Kitty')

# ________________________________________________

Attributes: Attributes are the instance objects.

# Example:

class Cat
  def initialize(name)
    @name = name # <- attributes
  end
end

# ________________________________________________

Initialize: A method that gets called everytime you create a new object. 

# example:
class Cat
  def initialize # <- gets called everytime you create a new object. 
    puts "I've been initialized!"
  end
end

# ________________________________________________

Instance: Variables: Variables that exist as long as the object instacnce exists. One way to tie data to objects.

# example:
class Cat
  def initialize(name)
    @name = name # <- @name is the instance variable
  end
end

# ________________________________________________

Instance: Methods: How we perform actions within an object.
You call instance methods by first calling the object, followed by the method name

# example:
class Cat
  def initialize(name)
    @name = name
  end

  def speak # <- Instance methods expose behaviour for objects
    "#{@name} meows"
  end
end

kitty = Cat.new('Kitty')
puts kitty.speak # <- calling the instance method

# ________________________________________________

Accessor: Methods: Only job is to return or reset an objects state, with getter and setter methods.
Conventionally, we name the getter and setter methods the same as the instance varaible we are exposing and setting.

# example:
class Cat
  def initialize(name)
    @name = name
  end

  def name #<- getter methods returns the @name instance variable
    @name
  end

  def name=(new_name) #<- setter methods set the instance variable to the passed in arguement
    @name = new_name
  end
end

# getter and setter shortcuts:
attr_accessor :name # <- this is shorthand for both the getter and setter method
attr_reader :name   # <- this is shorthand for the getter method, only returns the instance variable
attr_writer :name   # <- this is shorthand for the setter method, only sets the instance variable to the arguement passed in

within methods, we want to reference the getter method directly, instead of the instance variable.

# ________________________________________________





