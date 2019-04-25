What is OOP used for?
We use obect oriented programming techinques to seperate chunks of data into manageable pieces, and that if one functionality breaks,
it doesnt break the entire code. Much easier to manage. It also allows the programmer to think in another layer of abstraction by using
verbs and nouns for naming our methods. 

Encapsulation:
Is hiding pieces of functionality and making it acccesible or unaccessable outside the method, using the 'private' 
and 'protected' keywords. It is a form of data protection. The private keyword makes the code hidden by it, only accessible 
to the class in which it resides, you cannot call a method under the 'private' keyword. It will return a NoMethodError.
If you do need to use a method, but keep it hidden from outside of the object, you can use the 'protected' keyword.

# ________________________________________________

Private:
The private keyword is used when you have code that you dont want to be accessible to the rest of the program,
only to be used within the class in which it is called by other methods. Private methods can only be used within
the class definition. The only way to have external access a private method is to call it through a public method. 
Think of private methods as internal helper methods.

# example:
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years # PrivateMethodError

# ________________________________________________

Protected:
Just like private, protected methods are for internal use only, and cannot be called from outside the method directly.
You can call them externally through public methods. Were protecting methods under the protected keyword to
only be called explicitly 
From outside of the class, protected methods act just like private methods, are not accessible.
From inside the class, protected methods are accessible just like public methods.

# example:
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
puts giraffe.a_public_method #Will this work? Yes, I'm protected!

# ________________________________________________

Relationships:
Two types of relationships in Ruby are:
'Assossiation' can be thought of as a 'has-a' relationship. # A Library, HAS books
'Inheritance' can be thought of as an 'is-a' relationship. # An atlas IS A book

# ________________________________________________

Collaboration:
Is a way of modelling relationships betweeen different objects. Collaboration is a relatinship by assossitation - not of inheritance.
A collaborator can be of any object, depending on the design of the context of your program.
1. Collaborator objects can be of any type: Custom class object, hash, array, string, integer etc.
2. Collaborator objects are always part of another objects state.

# ________________________________________________

Polymorphism:
Is the ability for data to be represented as many types. Using pre-written code for multipe purposes. 
Inheritance and mixins are two ways in ruby to achieve polymorphism.

# ________________________________________________

Classes:
Classes define objects. Think of classes as a blueprint for objects. They hold all of the behaviors that an obeject will be capable of using. 
You define a class by the 'class' keyword.

# example of defining a class
class Cat; end

# ________________________________________________

Objects: 
Everything in ruby is an object. We use classes to create objects. Objects are a way of holding information from a class. 
You can find out what class an object is assigned to with the ::class method. Some objects will hold different information (state) than another object,
eventhough they are instances of the same class.

# creating an object:
kitty = Cat.new

kitty.class # <- returns the class in which 'kitty' called from

# ________________________________________________


States:
Tracks attributes for individual objects. Objects can have the same behaviours, but not the same states. States are created
when instantiating an object. Can be different for each object. Instance variables keep track of the state of an object.
State is the collection of all the instance variables and their values defined for an object. Since state is part
of the object, not the class, state is not inherited. 

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

Behaviors: 
Are what objects are capable of doing through instance methods. 

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

Attributes: 
An attribute is an instance variable name and value. Therfore, attributes must be accessible from outside the class
with accessor methods. An attributes getter and setter method values will be inherited by a superclass, but the name and value
behind the attribute do not participate in inheritance. Attribute getter and setter methods are inheritable.

# Example:

class Cat
  attr_accessor :name # <- attribute

  def initialize(name)
    @name = name
  end
end

# ________________________________________________

InitializeMethod: 
A method that gets called everytime you create a new object. Also known as the constructor method.

# example:
class Cat
  def initialize # <- gets called everytime you create a new object. 
    puts "I've been initialized!"
  end
end

# ________________________________________________

InstanceVariables: 
Variables that exist as long as the object instacnce exists. One way to tie data to objects.
Instance variables and their values are not inheritable.

# example:
class Cat
  def initialize(name)
    @name = name # <- @name is the instance variable
  end
end

# ________________________________________________

InstanceMethods: 
How we perform actions within an object.
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

AccessorMethods: 
Only job is to return or reset an objects state, with getter and setter methods.
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

the method attr_accessor is a ruby shrotcut that when called, created both a getter and a setter method
for the instance variable specified by the symbol passed in as an argument.

# ________________________________________________

Self: 

ClassMethods:
Self outside of the method defintion is referring to the class itself and can be used
to define a class method.

# example:
class Cat
  def self.speak
    puts 'Cat method speaks'
  end
end

Cat.speak # prints 'Cat method speaks'

Reassigning multiple instance variables at once:
Self within an instance method is referencing the instance (object) that called the method.

# example:
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_info(name, height, weight)
    self.name = name
  end
end

# ________________________________________________

ClassVariables: 
Are prefaced with two '@' symbols and are used to store class data. Such as a typical way to use class variables is
to keep track of how many instances of a certain class we have created. 

# example:
class Cat
  @@number_of_cats

  def initialize
    @@number_of_cats += 1
  end

  def self.total_number_of_cats
    puts @@number_of_cats
  end
end

kitty = Cat.new
felix = Cat.new
Cat.total_number_of_cats # prints 2, the total number of cats initalized

# ________________________________________________

Constants:
A type of variable that never changes.

# example:
class Cat
  AGE = 12
end

# calling a constant from outside of the class
Cat::AGE # returns 12

# ________________________________________________

LexicalScopeAndConstants:
Lexical scope means that the scope of the object remains limited to where its defined in the code.
Constants have different scoping rules than other variables, especially apparent in the case of inheritance.

# example of some confusion:
class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4, when you expect the out to be 2

# example of fixed problem:
class Car
  WHEELS = 4

  def wheels
    self.class::WHEELS # using the calling object to collect the WHEELS constant from class
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 2


# ________________________________________________


to_sMethod:
The puts method already calls to_s on its argument, which when called on an object, or instance of a class, 
returns the calling object. We add a custom to_s to the class to overide the default output. 

# example:
class Cat
  def to_s
    "I'm a cat!"
  end
end

kitty = Cat.new
puts kitty # prints: 'I'm a cat!'

# ________________________________________________

Inheritance:
Is when a class inherits behaviours from another class. We use the '<' symbol to signify that Cat and GoodDog
are both inheriting behaviours from the Animal class. A subclass inherits the methods of the superclass.

# example:
class Animal
  def speak
    "Hello!"
  end
end

class Cat < Animal
end

class GoodDog < Animal # Inheritance is created by the '<' symbol
end

# ________________________________________________

Super:
super is a built in function that allows us to call methods up the inheritance heirarchy. When you call
super from within the method, Ruby will look for a method up the inheritance heirarchy of the same name and invoke it. 

# example:
class Animal
  def speak
    "Hello! "
  end
end

class Cat < Animal
  def speak
    super + "I'm a cat!"
  end
end

kitty = Cat.new
puts kitty.speak

# multiple arguemnts example
class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end

  def to_s
    "#{@name}, #{@color}"
end

kitty = Cat.new
puts kitty

# ________________________________________________

Modules:
Extracting multi use methods to a superclass. A way to add in behaviours to a class. 
Usually if the behaviours can be used accross multiple Classes.
They also use the 'has a' relationship with the class objects. You cannot create an object within a module. 
It is convention in Ruby to use the 'able' suffix when naming modules because the verb describes exactly
what the module is doing.

# example
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable # mixing in swimmable module
end

class Mammal < Animal

class Dog < Mammal
  include Swimmable # mixing in swimmable module
end

class Cat < Mammal
end


Namespacing:
Grouping similar classes under one module. You can use modules to group similar classes.
You call call the classes by appending the module name with the class name by two colons (::)

# example:
module Mammal
  class Cat
    def speak
      "Meow"
    end
  end

  class Dog
    def speak
      "Woof"
    end
  end
end

kitty = Mammal::Cat.new
puts kitty.speak

CallingMethodsFromModules:

module Mammal
  def self.some_out_of_place_method(num)
    num ** 2
  end
end

puts Mammal.some_out_of_place_method(3) # 9

# ________________________________________________

Implicit: (programming term)
In programming, implicit usually refers to something that is alreday done for you in the code behind the scenes.

Explicit: (programming term)
Explicit is the manual way you want to achieve the change you wish to have by writing out the instructions as
clearly as possible.

# ________________________________________________

FakeOperators:
Fake operators are methods we define in the class that look like operators. Such as the >, or == methods. We overide the default method
and define a new one in our class. We use these methods to make our code easier to read.

# example:
class Cat
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def >(other)
    self.num > other.num
  end

end

kitty = Cat.new(6)
rufus = Cat.new(2)

puts kitty > rufus

# ________________________________________________










