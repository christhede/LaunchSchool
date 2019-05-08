What is encapsulation?
Encapsulation is hiding functionality from outside of the class with the private and protected keywords. 
Encapsulation makes code hiddin outside of the codebase. 

Polymorphism is the ability for data to be represented as many different types.
Such as in the case of inheritance and modules.

# example:
class Animal
	def eat
		"Generic eat method"
	end
end

class Cat < Animal
	def eat
		"Cat eat method"
	end
end

class Dog < Animal
	def eat
		"Dog eat method"
	end
end

group_of_animals = [Animal.new, Cat.new, Dog.new]

group_of_animals.each do |animal|
	puts animal.eat
end