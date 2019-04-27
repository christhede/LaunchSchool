Object oriented programming is used as a way to organize code into managable chunks of code. It aslo allows the user to think in a different
layer of abstration because we use Verbs and nouns to define the classes. 

What is encapsulation?
Encapsulation is a term used for how we allow the code to be unaccessable or accessible outside of the class, using the private and proteced keywords.
Any method underneath the private keyword is not directly accessible outisde of the class. The only way to access those methods are through a differnt
public method within the class. The protected keyword acts very similar to the private keyword, in that you cannot access it from outside of the object, and
it is only explicitly available, such as calling the method with self. 

What is inheritance?
Inheritance is a way to share behaviours between a superclass and a subclass. We use the '<' operator to specify which superclass we are inheriting from.

# example:
class Mammal
  def breathes
    'aaaahhhh'
  end
end

class Dog < Mammal
end

doggo = Dog.new
doggo.breathes

What is an object?
Everything in ruby is an object. They can be an integer, array, hash and so on. Objects are tools to store information from a class. Objects are instances of classes.
You can create objects by calling the method 'new' on the class. Objects can have the same behaviours, but differnent states. 

What is a class? 
A class in ruby is a blueprint for objects. They hold certain behaviors  Objects are created from classes. 

What does lexical scope mean? 
Lexical scope is a term used to describe the scope of an object that remains limited to where it was defined in the code. Specifically constants in 
ruby use lexical scope, and have differnt scoping rules from other variables, especially apparent in the case of inheritance.

What are Modules?
Modules are a way adding in behaviours to classes. Usually if multiple classes can use the same behaviours or methods, we use modules to consolidate
all the methods needed and add them into the specified class with the 'include' keyword. 

Method Lookup Path
The method lookup path is the order in which ruby will look for the method that is being called. You can find the visual lookup path with the 
method ancestors. method::ancestors will print out the lookup path, ending in Object

What is self? 
Self is a keyword used to do two things in ruby. When self is seen outside of a method, it is referencing the class itself. Such as a class method. 
A class method can only be called from the class itself. When self is seen inside of an instance method, it is referencing an accessor method. 

# example:

