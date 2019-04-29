What is OOP used for?
We use the object oriented programming paradigm to seperate chunks of data into manageable containers. With being able to seperate chunks of code,
if one piece of functionality breaks, it doesnt break the entire code. It also allows the programmer to think in another layer of abstraction by using
verbs and nouns for naming our methods. 

Encapsulation:
Is hiding pieces of functionality and making it unvavailable outside of the code base, using the 'private' 
and 'protected' keywords. It is a form of data protection. The private keyword makes the code hidden by it, only accessible 
to the class in which it resides, you cannot call a method under the 'private' keyword. It will return a NoMethodError.

# ________________________________________________

Polymorphism:
Is the ability for data to be represented as many differnt types. Such as class instances, or objects, might have the same behaviours, 
but not the same state. Is the ability for data to be represented as many types. Using pre-written code for multipe purposes. 
Inheritance and mixins are two ways in ruby to achieve polymorphism.

# ________________________________________________

Private:
The private keyword is used when you have code that you dont want to be accessible outside of the class. They are 
only to be used within the class in which it is called by other methods. The only way to have external access to a private method is to 
call it through a public method. Think of private methods as internal helper methods.

# example:
class GoodDog
  DOG_YEARS = 7

  def initialize(n, a)
    @name = n
    @age = a
  end

  def human_years
    age * DOG_YEARS
  end

  private

  attr_accessor :name, :age
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.human_years # 28
puts sparky.name # Private method error
puts sparky.age # Private method error

# ________________________________________________

Protected:
From outside of the class, protected methods act just like private methods, and are not accessible. The only way to have external 
access to a protected method is to call it through a public method. From inside the class, protected methods are accessible just like public methods.

The difference betweeen private and protected methods are...

# example:
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method # self is referencing the object, in this case is Giraffe.a_protected_method
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

Collaborator Objects:
Objects that are stored in state with another object are called collaborator objects.
Is a way of modelling relationships betweeen different objects. Collaboration is a relatinship by assossitation - not of inheritance.
A collaborator can be of any object, depending on the design of the context of your program.
1. Collaborator objects can be of any type: Custom class object, hash, array, string, integer etc.
2. Collaborator objects are always part of another objects state.


# ________________________________________________

Classes:
Classes define objects. Think of classes as a blueprint for objects. They hold all of the behaviors that an obeject will be capable of using. 
You define a class by the 'class' keyword.

# example of defining a class
class Cat; end

# ________________________________________________

Objects: 
Everything in ruby is an object. We use classes to create objects. Objects are a way of holding information from a class. 
You can find out what class an object is assigned to with the 'class' method. Some objects will hold different information (state) than another object,
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
    @age = 12 #<- Instance variables keep track of state.
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

  def speak           # <- Instance methods expose behaviours for objects
    "#{@name} meows"  #
  end                 #
end

felix = Cat.new('Felix')
kitty = Cat.new('Kitty')

# ________________________________________________

Attributes: 
An attribute is an instance variable name and value. Therfore, attributes must be accessible from outside the class
with accessor methods. 

An attributes getter and setter method values will be inherited by a superclass, but the name and value
behind the attribute do not participate in inheritance. Attribute getter and setter methods are inheritable.
  
"Ruby defines the attributes of its objects by defining instance methods that initialize instance 
variables, instantiated from the classes."

# Example:

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Kitty')
kitty.name # returns 'Kitty' <- That is the attribute
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
Instance variables are responsible for keeping track of an objects state. They are one way to tie data to objects.
They exist as long as the object instance exists.
Instance variables and their values are not inheritable, but instance variables within a getter or setter method, are. 

# example:
class Cat
  def initialize(name)
    @name = name # <- @name is the instance variable
  end
end

# ________________________________________________

InstanceMethods: 
How we perform actions within an object.
You call instance methods by first calling the object, followed by the method name.

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
Conventionally, we name the getter and setter methods the same as the instance variable we are exposing and setting.

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

within methods, we want to reference the getter method directly, instead of referencing the instance variable.

the method attr_accessor is a ruby shortcut that when called, creates both a getter and a setter method
for the instance variable specified by the symbol passed in as an argument.

# ________________________________________________

Self: 

Self outside of the method defintion is referring to the class itself and can be used to define class methods.

# example:
class Cat
  def self.speak # <- self infront of the method names means it's referencing the class
    puts 'Cat method speaks'
  end
end

Cat.speak # prints 'Cat method speaks'

Self within an instance method is referencing the instance (object) that called the method.

Can be used for reassigning multiple instance variables at once:
Use self when calling setter methods from within the class. We use self to target the setter method, if we didnt have self, Ruby would think
we wanted to set a new local variable. 

# example:
class Cat
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def change_info(name, height, weight)
    self.name = name
    self.height = height
    self.weight = weight
  end

  def info
    "#{name}, #{height}, #{weight}"
  end
end

self only works before a method name within an instance method, if the method name were referencing is a setter method.
We can reference getter methods like this, but it is uneeded.

You can also call module methods explicitly by prepending the self keyword infront of methods. I like to think of these as 'module-class methods'

# example:
module Swimmable
  def self.swim
    "I'm swimming!"
  end
end

puts Swimmable.swim # I'm swimming!"


# ________________________________________________

ClassVariables: 
Class variables are prefaced with two '@' symbols and are used to store class data. A typical way to use class variables is
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
A type of variable that should never change.

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
puts bullet.wheels # => 4, when you expect the output to be 2

# example of how to fix the problem:
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


to_s Method:
The puts method already calls to_s on its argument, which when called on an object, or instance of a class, 
returns the calling object. We add a custom to_s to the class to overide the default output. 

# example:

class Cat; end

kitty = Cat.new
puts kitty # prints: #<Cat:0x00007fee9a94b278> 


class Cat
  def to_s
    "I'm a cat!"
  end
end

kitty = Cat.new
puts kitty # prints: 'I'm a cat!'

# ________________________________________________

Inheritance:
Is when a class inherits behaviours from another class. In our example, we use the '<' symbol to signify that Cat and GoodDog
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

kitty = Cat.new
puts kitty.speak # prints out "Hello!"
# ________________________________________________

Super:
super is a built in function that allows us to call methods up the inheritance heirarchy. When you call super from within the method, 
Ruby will look for a method up the inheritance heirarchy of the same name and call it. 

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
puts kitty.speak # "Hello! I'm a cat!"

# multiple arguement example
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
end

kitty = Cat.new('kitty', 'brown')
puts kitty # "kitty brown"

# ________________________________________________

Modules:
Modules are used to extract multi-use methods to multiple classes. The module is mixed into a class using the 'include' keyword, 
followed by the module name. Modules use the assossiation, or 'has-a' relationship with classes. Such as, we have class named 'Cat', and we want to mixin
a module named 'Clawable'. Our cat HAS claws to use. In Ruby, it is conventional to use the 'able' suffix when naming modules because the
verb describes what the module is capable of doing. You cannot create an object from a module.

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

class Cat < Mammal # cat don't like to swim, so we don't include this module
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
Fake operators are symbols that look like operators, but are actually instance methods we define in the class for special functionality.
Such as the >, or == methods. We overide the default method and define a new one in our class. We use these methods to make our code easier to read,
as well as .

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

Equality:
The == operator is actually a method in ruby that compares two objects to see if they are the same value. By default, == will return a boolean.
Behind the scenes, the == actually looks like this: str1.==(str2). But with Rubys syntactical sugar, it lets us use it this way: str1 == str2
 
equal? is a method that not only checks to see if two objects are the same value, but if they are pointing to the same space in memory.

In Ruby, since you cant modify a symbol or an integer, two symbols or two objects with the same value, means they are also pointing to the same object.

str1 = "something"
str2 = "something"
str3 = str1

puts str1 == str2 # true

puts str1.equal? str2 # false

puts str1.equal? str3 # true

# ________________________________________________

===
The === method is implicity used in case statements. Where === is invoked on a range and passed in an arguement.

# example:
if (1..50) === 25
  puts "Yes it's in there."
else
  puts "no it is not"
end

Exceptions:
An exception is basically an exceptional state in your code. Its not necessarily a bad thing, but it is a way that the code lets you know something
behaved unexpetedly.



























