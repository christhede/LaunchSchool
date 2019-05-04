What is collaboration?
collaboration occurs when you add an object to another objects state.
Collaborator objects can be of any object, custom object, stings, integers, arrays, hashes.



What is oop?
OOP is a programming paradigm seperate chunks of code into manageable containers. 
Those containers can then talk to each other and interact with each other by way of inheritance, 
collaboration or mixins. OOP is useful because it allows us to think in another layer of abstraction, 
using verbs and nouns to name the containers.


How are constants used in classes? 

Constants, within classes have lexical scope, which means that the constant remains limited to 
where it was initially defined in the code. If a constant has been defined in a class, it will keep these 

example: 

class Vehicle
	def how_many_wheels
		"#{self.class::WHEELS} wheels"
	end
end

class Car < Vehicle
	WHEELS = 4

	def to_s
		"#{WHEELS}"
	end
end

class Truck < Vehicle
	WHEELS = 18
end

tonka = Truck.new
puts tonka.how_many_wheels

herbie = Car.new
puts herbie.how_many_wheels

What is inheritance?
Inheritance is sharing, or inheriting behavioiurs from a parent class. 

class Animal
	def speak
		"Hello!"
	end
end

class Cat < Animal
end

kitty = Cat.new
puts kitty.speak


What are modules? What is the difference between a class and a module? 
Modules are very similar to classes, and the biggest difference is that you cannot instantiate an object from a module. 
You can only create objects from classes. You can mixin as many modules into a class as you want, but you can only
inherit one class in Ruby. 

module Swimmable
	def swim
		"I'm swimming!"
	end
end

class Cat
	include Swimmable

	def initialize
		@name = name
	end

	def to_s
		"#{swim}"
	end
end

kitty = Cat.new
puts kitty

What is encapsulation?

Enc



