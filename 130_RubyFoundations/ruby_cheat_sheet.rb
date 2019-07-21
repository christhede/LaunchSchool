--------------------------------------

PEDAC process
1. Problem
Understand the problem 
• Identify input and output
• Make the requirements explicit
• Identify rules
• Mental model of the problem (optional)
2. examples/test cases
• Validate understanding the problem
3. Data structure
• How we represent data that we will work with when converting the input to output.
4. algorithm
• Steps for converting input to output
5. code
• Implementation of Algorithm

--------------------------------------

What is OOP used for?
We use the object oriented programming paradigm to seperate chunks of data into manageable containers. With being able to seperate chunks of code,
if one piece of functionality breaks, it doesnt break the entire code. It also allows the programmer to think in another layer of abstraction by using
verbs and nouns for naming our methods.

Encapsulation:
Is hiding pieces of functionality and making it unvavailable outside of the code base, using the 'private'
and 'protected' keywords. It is a form of data protection. The private keyword makes the code hidden by it, only accessible
to the class in which it resides, you cannot call a method under the 'private' keyword. It will return a NoMethodError.

class Cat
  def initialize(name)
    @name = name
  end

  private
  
  attr_reader :name
end

kitty = Cat.new('kitty')
puts kitty.name

--------------------------------------

Polymorphism:
Modules and inheritance are uses of polymorphism.
Is the ability for data to be represented as many differnt types. Such as class instances, or objects, might have the same behaviours, but not the same state.
The ability of different objects to respond in different ways to the same message (i.e. method call)
Polymorphism is the provision of a single interface to entities of different types. Method overidinig, module mixins.
Polymorphism is designing your methods in such a way that you can treat a bunch of different types as one single type.

# excample:
class Animal
  def eat
    'generic eat method'
  end
end

class Fish < Animal
  def eat
    'eating specific to fish'
  end
end

class Cat < Animal
  def eat
     'eat implementation for cat'
  end
end

def feed_animal(animal)
  puts animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

--------------------------------------

Ducktyping:
Duck typing in computer programming is the application of the 'duck test'. "If it walks like a duck and quacks like a duck,
then it must be a duck." To be determined that if a method can be used for a particular purpose.
In duck typing, an objects suitability is determined by the presense of certain methods and properties
rather than the type of obejct itself.

# example:
class Duck
  def quack
    'Quack!'
  end

  def swim
    'Paddle paddle paddle...'
  end
end

class Goose
  def honk
    'Honk!'
  end

  def swim
    'Splash splash splash...'
  end
end

class DuckRecording
  def quack
    play
  end

  def play
    'Quack!'
  end
end

def make_it_quack(duck)
  duck.quack
end

puts make_it_quack(Duck.new)
puts make_it_quack(DuckRecording.new)

def make_it_swim(duck)
  duck.swim
end

puts make_it_swim(Duck.new)
puts make_it_swim(Goose.new)

--------------------------------------

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

--------------------------------------

Protected:
From outside of the class, protected methods act just like private methods, and are not accessible. The only way to have external
access to a protected method is to call it through a public method. From inside the class, protected methods are accessible just like public methods.
Protected can access another object's protected method that comes from the same class, Private can't.

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

--------------------------------------

Relationships:
Two types of relationships in Ruby are:
'Assossiation' can be thought of as a 'has-a' relationship. # A Library, HAS books
'Inheritance' can be thought of as an 'is-a' relationship. # An atlas IS A book

--------------------------------------

Collaborator Objects:
Objects that are stored in state with another object are called collaborator objects.
Is a way of modelling relationships betweeen different objects. Collaboration is a relatinship by assossitation - not of inheritance.
A collaborator can be of any object, depending on the design of the context of your program.
1. Collaborator objects can be of any type: Custom class object, hash, array, string, integer etc.
2. Collaborator objects are always part of another objects state.


 dependancies - review

--------------------------------------

Classes:
Classes define objects. Think of classes as a blueprint for objects. They hold all of the behaviors that an obeject will be capable of using.
You define a class by the 'class' keyword.

# example of defining a class
class Cat; end

--------------------------------------

Objects:
Everything in ruby is an object. We use classes to create objects. Objects are a way of holding information from a class.
You can find out what class an object is assigned to with the 'class' method. Some objects will hold different information (state) than another object,
eventhough they are instances of the same class. Classes are the molds and objects are what is procured from a mold.

# creating an object:
kitty = Cat.new

kitty.class # <- returns the class in which 'kitty' called from - Cat

--------------------------------------

MethodLookup:
The order in which Ruby looks for a called method. You can find the path Ruby looks for the method called by using
the ancestors method.

module Speakable
  def speak
    'ahhhh'
  end
end

class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  include Speakable
end

puts Cat.ancestors

# cat
# speakable
# animal
# object
# kernal
# Basicobject

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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

--------------------------------------

InitializeMethod:
A method that gets called everytime you create a new object. Also known as the constructor method.

# example:
class Cat
  def initialize # <- gets called everytime you create a new object.
    puts "I've been initialized!"
  end
end

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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


--------------------------------------

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

--------------------------------------

Constants:
A type of variable that should never change. Constants within a class use lexical scope.

# example:
class Cat
  AGE = 12
end

# calling a constant from outside of the class
Cat::AGE # returns 12

--------------------------------------

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


# constants have lexical scope, which means they remain where they were first defined

module ChangeWheels
  def change_wheels
    "Changing #{self.class::WHEELS} wheels!"
  end
end


class Car
  include ChangeWheels

  WHEELS = 4

  def number_of_wheels
    WHEELS
  end
end

class Motorcycle
  include ChangeWheels

  WHEELS = 2
end

herbie = Car.new
p herbie.number_of_wheels

bike = Motorcycle.new

p herbie.change_wheels
p bike.change_wheels

# Class is an object and Object is a class.

p String.ancestors

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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

--------------------------------------

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

--------------------------------------

Implicit: (programming term)
In programming, implicit usually refers to something that is alreday done for you in the code behind the scenes.

Explicit: (programming term)
Explicit is the manual way you want to achieve the change you wish to have by writing out the instructions as
clearly as possible.

--------------------------------------

FakeOperators:
Fake operators are symbols that look like operators, but are actually instance methods we define in the class for special functionality.
Such as the >, or == methods. We overide the default method and define a new one in our class. We use these methods to make our code easier to read,


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

--------------------------------------

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

--------------------------------------

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

>> Closures:
# General programming concept that allows programmers to save a chunk of code and execute it at a later time. Its called a closure because its said to bind its surrounding artifacts and builds an enclosure around everything to be called upon later. You can think of a closure as a method that you can pass around and execute. In Ruby, closures are implemented in a Proc object. 

# three ways of using closures in Ruby (or Proc objects):
# 1. Instantiating an object from the Proc class
# 2. Using lambdas
# 3. Using blocks

--------------------------------------
>> Blocks
# In Ruby, method blocks have lenient arity rules, which is why it doesnt complain when you pass in different number of arguments; Method Blocks dont enfore arguement count

# Adding blocks to methods gives the method extra functionality. You can call the method while passing in different information to the block.
    
# Blocks are one way to implement a closure in Ruby. Closures are a way to pass around chunks of code. Blocks can take arguments, just like regular methods. Unlike regular methods, it wont complain about the wrong number of arguments passed in. Blocks return a value, just like normal methods. Blocks are a way to defer information decisions until invocation time. It allows method callers to refine the method for a specific use case. Allows for multi-functional method building. Good for sandwich code scenarios, like closing a Fileautomatically.

# Two main use cases are:
# 1. Defer some implementation code to method invocation decision.
# 2. Methods that need to perform some "before" and "after" actions - sandwich code.

--------------------------------------

>> Proc:
# Blocks of code that have been bound to a set of local variables. Once bound, the code may be called in diffferent contexts and still access those variables - its binding. Procs do not care if they receive a wrong number of arguments, they will run anyways, leaving arguemnts blank in the code.

# Proc example
my_proc = proc { |thing| puts "This is a #{thing}." }
my_proc.call # returns 'This is a .'
my_proc.call('cat') # returns 'This is a cat.'
my_proc.call('cat', 'mouse') # returns 'This is a cat.'

my_second_proc = Proc.new { |thing| puts "This is a #{thing}." } # a different proc syntax
my_second_proc.call # returns 'This is a .'
my_second_proc.call('dog') # returns 'This is a dog.'

--------------------------------------

>> Lambda:
# Lambas are functions in Ruby that act anonmylously. They are part of the Proc class.
# Lambdas DO care if they receive a wrong number of arguments, they will return an ArgumentError if ran without the right number of arguemnts. 

# Lamda examples
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_lambda.call # returns ArgumentError
my_lambda.call('dog') # reuturns 'This is a dog.'
my_lambda.call('dog', 'mouse') # returns ArguementError

my_second_lambda = -> (thing) { puts "This is a #{thing}." } # a different lambda syntax
my_second_lambda.call # returns ArguementError
my_second_lambda.call('bird') # returns 'This is a bird'
my_second_lambda.call('bird', 'moose') # returns ArguementError
 
--------------------------------------

>> Yield:
# Calls the passed in block. The yield keyword executes the block. When we yeild, we can pass arguements to the block. When we yield, we have to be aware of the blocks return value. 
  
#example:
def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!") { puts "world" }   

--------------------------------------

>> Kernel#block_given?
# Checks to see if the method is given a block to run at invocation

def echo_with_yield(str)
  yield if block_given?
  str
end

--------------------------------------
  
# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end 

--------------------------------------
  
>> Methods with Explicit Block Parameters
# Explicit block paramets have an & symbol infront of the parameter. The & symbol converts the block parameter into a simple proc object. We drop the & symbol when referencing the parameter in the code.Ruby converts explicit blocks into simple Proc objects. You invoke those proc objects with the 'call' method.
  
#example:
def test(&block)
  puts "What's &block? #{block}"
end

--------------------------------------

>> Binding (or surrounding evironment/context)
# Procs keep track of their surrounding context, and drags it around wherever the 'chuck of code' is passed along with. This includes local variables, method refernces, constants, whatever it needs to execute the code. 

# example:
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)
  
--------------------------------------

Symbol#to_proc 
# Is a shortcut in ruby when using methods that can take blocks.

# example:
[1, 2, 3, 4, 5].map (&:to_s)

--------------------------------------

<<<MINITEST>>>

Why do we write tests?
  # As beginners, we write tests to prevent regression. Thats it.

--------------------------------------

=> Arity
The rules around enforcing the number of arguments you can call on a closure

--------------------------------------

>> Test Suite
# All of the tests for the project that accompanies your program or application. 

>> Test
# A situation or context in which tests are run. For Example, this test is about making sure you receive an error message when typing in the wrong password. A test can contain multiple assertions. 

>> Assertion
# This is the actual verification step to confirm that the data returned by your program or application is needed what is expected. You make one or more assertions within a test. 

--------------------------------------

>> skip
# Placed before the test, it allows the test to be skipped.

# example:
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip # <---------------- here
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

--------------------------------------

>> Refutations
# opposite of assertions

--------------------------------------

>> Setup Method
Sets up information for the rest of the test suite. 

--------------------------------------

>> SEAT Approach
# 1. Setup the necessary objects
# 2. Execute the code against the object were testing
# 3. Assert the results of the execution
# 4. Tear down and cleanup any lingering artifacts

--------------------------------------

>> HERDOC
# Here documents are used when you need a string that spans multiple lines. You can name the HEREDOC anything you need. HEREDOCS are used with the << followed by the name of the HEREDOC. You can string methods onto the ends of HEREDOCS. As of Ruby 2.3, you can use the '~' to remove proceeding white spaces.

# example:
long_string = <<LONGSTRING.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
LONGSTRING

long_string = <<~LONGSTRING.chomp
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
LONGSTRING

--------------------------------------

>> File class
# You use the File class when reading a document that is in simple text. You can do this by using the File#open method, and you have to also close the file with File#close.

# example:
file = File.open('sample_text.txt', 'r')
# do processing here
file.close

--------------------------------------

(&:to_s)

First, Ruby checks that the object after & is a proc object, if it isnt, it call to_proc on it. An error will occur if it cannot turn it into a proc object.
Then, if all is well, it turn the proc into a block.

--------------------------------------

>> assert_same
# Checks to see if both objects are the same, using object ids. If they are not, then it fails.

require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2) # <--- passes, using the == method
    assert_same(str1, str2) # <---- does not pass, because it checks object ids. must be the same object
  end
end

--------------------------------------

>> assert_equal
# takes on two parameters. The first is the expected value, and the second is the test or actual value. If theres a descrepency, assert_equal will save that error and Minitest will report that error. This is the most common assertion. 

# example:
assert_equal(4, car.wheels)

# checks to see if both values are the same value, not the same object. 

--------------------------------------

Enumerator::Yielder
How enumetators pass values to a method/method block downstream.

# example:
e = Enumerator.new do |yielder|
  yielder << 1
  yielder << 2
end

e.map { |n| n * 2 } # => [2, 4]

# In the first iteration, the  number 1 is being passed to the yielder, which takes place of the n parameter, which evaluates to 2, then in the the number 2 is passed to the yielder, which takes place of the n again, and that evaluates to 4, then map returns an array of the evaluated numbers from the block.

--------------------------------------

>> Prime numbers
# Are numbers greater than one that can only be divisable by 1 and itself.
# These numbers include: 2, 3, 5, 7, 11, 13, 17, 19, 29 etc. 

>> Composite Numbers
# The opposite of prime numbers

--------------------------------------

>> Sieve of Eratothenes
# Starting with an array of 2 to n, we say that all numbers are prime.
# Then, starting at 2, we say that all divisiable remaining numbers of 2 must not be prime.
# Then, moving up the array, we say that 3 is prime, but all divisable numbers of 3 must not be prime.

--------------------------------------

>> Base 10
Base 10 is commonly used around the world, and uses decimal places. Base 10 is the bases of the place value number system and is also called the decimal system. It uses 10 as its base number, hence the name. 

example: 
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
= 200 + 30 + 3
= 233

>> Base 8
Uses the same algorithm as base 10, but instead of the power of 10s, we use the power of 8s. 

example:
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

>> Trinary (Base 3)
Similar to the above, but the number does not allow number above 3.

example:
# "102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302


>> Base 2 - Binary

--------------------------------------

 >> REGEXP:
 # Holds a regular expression used to match a pattern against strings.
 # Created using the brackets /.../


>> =~ operator:
# Rubys basic pattern matching operator

/stack/ =~ 'haystack' #=> 3
'haystack' =~ /stack/ #=> 3
/stick/ =~ 'haystack' #=> nil

>> match method:
Returns a MatchData object

/stack/.match('haystack') #=> #<MatchData "stack">
backslash-escape these objects (, ), [, ], {, }, ., ?, +, *.
/\(OK\)/.match('(OK)')

>> Character classes:
# Delimitated with square brackets [] and lists characters that might appear at that point in the match.
# [ab] means 'a' or 'b', /ab/ means 'ab'

/W[aeiou]rd/.match("Word") #=> #<MatchData "Word">
# Ranges can be written out like this [a-z] || [A-Z] || [a-zA-Z]

# If the first character is a caret (^), then the rest is inverted and matches everything except those named.
/[^a-eg-z]/.match('f') #=> #<MatchData "f">

# The following also acts like character classes:
/./ - any character except newline
/./m - any character, the m represents newline mode
/\w/ - a word character ([a-zA-z0-9])
/\W/ - a non-word character ([^a-zA-z0-9])
/\d/ - a digit character ([0-9])
/\D/ - a non-digit character ([^0-9])
/\f/ - a hexdigit character ([0-9A-Fa-f])
/\F/ - a non hexdigit character (^[0-9A-Fa-f])
/\S/ - a non whitespace character

>> POSIX bracket expressions
similar to chracter classes.

>> Repetition: 
# The above can be followed by a repetition metacharacter to specify how many times they need to occur. Such metacharacters are called quanitifiers.
* - zero or more times # /[^a-eg-z]*/.match('fff')
+ - one or more times # /[^a-eg-z]*/.match('fff')
? - Zero or one times (optional)
{n} - exactly n times
{n,} - n or more times
{.m} - m or less times
{n,m} - at least n and at most m

>> Grouping:
# Paratheses also group the terms they enclose, allowing them to be quantified as one atomis whole.

The pattern below matches a vowel followed by 2 word characters:
/[aeiou]\w{2}/.match("Caenorhabditis elegans") #=> #<MatchData "aen">
Whereas the following pattern matches a vowel followed by a word character, twice, 
i.e. [aeiou]\w[aeiou]\w: 'enor'.
/([aeiou]\w){2}/.match("Caenorhabditis elegans") #=> #<MatchData "enor" 1:"or">

>> Anchors:
# Anchors to a specific position in the string.  

 ^ - matches beginning of line # /^abc/.match('abcd')
 $ - matches end of line
 \A - matches begining of string # /\Aabc|th|ch/.match('chris') #<MatchData "abc"
 \Z - matches end of string, if string ends in a newline
 \z - matches end of string
 \G - matches first matching position
 \b - matches word boundries when outside brackets
 \B - matches non word boundries

 >> Alternation:
 # Using the pipe characters (|) to seperate patterns of two or more. Matches any instance of the succession of the characters betwen the pipes
 example:

/cat|dog|rabbit/ #matches
The lazy 'cat.'
The 'dog' barks.
Down the 'rabbit' hole.

>> Flags/Modifiers
# append certain characters after the closed '/' to modify the regex. 

/i 
# append 'i' to the end of the regex, on the other side of the closing slash, to ignore the case and select any instance of the word in any case format.
example:
/launch/i #matches 'launch', 'LAUNCH', 'Launch'

>> Quantifiers:
* - zero or more times
+ - one or more times
? - once or not at all

adding a lazy match:
use the ? operator after any of the above quanitifiers.

example: 
xabcbcbacy.match(/a[abc]*?c/) # matches 'abc' and 'ac'

--------------------------------------

>> gsub

>> sub

--------------------------------------

>> Stamp Rubygem
# Lets you format dates and times based on human-friendly examples, not arcane strftime directives.
example:
require 'date'

date = Date.today
date.stamp('March 4, 2019') # => July 21, 2019
date.stamp('04/05/2019') # 07/21/2019

--------------------------------------

>> Rake Rubygem
# Automates many functions that require to build, test, package and install programs.

# call rake methods with:
bundle exec rake methodname
# example:
bundle exece rake hello # => "Hello There"

bundle exec rake # outputs the default method, we dont need to call default to execute.

bundle exec rake -T # shows all of the tasks designed by Rake.

--------------------------------------

require "bundler/gem_tasks"
# Adds several tasks to your Rakefile that are common to Rubygems.
# It defines: rake build, rake install and rake release. 

--------------------------------------

>> dependancies
Are the rubygems attached to a project folder 









