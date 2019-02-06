def greeting(str)

end

# one line 1-3 we define the method `greeting` wich takes one parameter `str`

greeting do |x|

end

# on line 7 we are invoking the method `greeting` and passing in a do..end block 
# with one parameter `x` as an arguement

greeting("bingo")

# invoking the method `greeting` with the string object `bingo` as an argument

a = 'bingo'
# on line 14 we initialize the local variable `a` and assign it to the string object `bingo`

a =  "Hello"
[1, 2, 3].map { |num| a }

# on line 18, we assign the local variable `a` to the string object `"Hello"`

# on line 19, we are invoking the Array#map method on an array of integers `[1, 2, 3]`, 
# and passing in a do..end block with one parameter `num` as an arguement. The method then interates through the
# array and passes each return value of the block to a new array, which after iterating, returns the new array 
# "[Hello, Hello, Hello"]`

"#{a}"
# => String Interpolation

puts a
# outputs the string object `"Hello"` to the screen and returns nil

a << 's'
# the string object "s" is being concatenated to the end of the local variable `a` which is 
# referencing the string object 'Hello'. This is a destructive method as it returns "Hellos". 
# This could also be written as a.concat('s').

a += 's'
# we are reassigning, the local variable a, 's' on the end

+=
# reassignment operator 
# does not mutate the object
# a = a + 1

[1, 2, 3, 4].each { |num| puts num }
# iterates through the array object passing each element of the array to the block
# outputs the value of parameter num
# when it finishes every iteration, it returns the original array
# doesn't care about return value of the block 
# [1, 2, 3, 4]

[1, 2, 3, 4].map { |num| puts num }
# iterates through the array passing each element of the array to the block 
# takes the return value of the block and moves it into a new array
# when finished, it returns that new array 
# [nil, nil, nil, nil]

[1, 2, 3, 4].select { |num| puts num }
# iterates through the block passing each element of the array to the block and runs the block
# considers if the return value of the block evaluates to true or not
# if it does, then it takes that element and puts it in a new array

variable scope
# Variables initialized in an outer scope can be accessed in an inner scope, but not vice versa.

variable shadowing

a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

55 4 2 

# So on line 5 we are actually assigning integer 5 to the local variable a passed 
# in as a parameter of the do..end block and the value of our local variable a 
# initialized in outer scope remains 4.

Mutating vs Non-mutating methods

# Mutating methods change the value of the object that is calling it, so the object.id stays the same
# Integers and symbols in Ruby with same values occupy the same physical space in memory(they are the same objects) 

puts vs return


variables as pointers


false vs nil and the idea of "truthiness"
nil
# nil is a special value reserved to indicate the absence of value.
false 
# false as in the boolean false

# In Ruby, every value apart from false and nil, evaluates to true


method definition and method invocation
def greeting # method definition 
   # a method definition can't access local variables in another scope
   # The only variables a method definition has access to must be passed into the method definition.
   # Just remember: local variables that are not initialized inside a method definition must be 
  # passed in as parameters.
greeting() # method invocation


implicit return value of method invocations and blocks



greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

# on line 27, we assign the string object `Hello` to the local variable `greeting` 

# on line 72 we have the loop method with a do..end block passed in as an arguement to the method. 
#   then on line 73 we reassign the local variable `greeting` to the string object `Hi`
#   On line 74 we use the keyword break to break out of the loop. Then on line 77 we have the puts method 
#   passing in the local variable `greeting` as it's arguement which prints `Hi` and returns nil.
#   This example demonstrates local variable scope within blocks and more specifically that local variables 
#   assigned in the outer scope are accessable in the inner scope.

a = 'hello'
b = a
a = 'goodbye'

# on line 88 we initialize the local variable `a` and assign it to the string object `hello`
# on line 89, we initialize the local variable `b` to the variable `a`, which is referening the string `hello`
# on line 90, we reassign the local variable `a` and assign it to the string object `goodbye`

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')


# on lies 96-103 we are defining the method `example` which takes one parameter
# on line 105 we invoke the method `example` and pass in the string object `hello` as it's arguement
# then on line 97, we initialize the local variable `a` and assign it to the integer `3`
# on line 98, we invoke the loop method with a do..end block as it's arguement. 
#   On line 99 we invoke the puts method and pass local variable `str` in as an arguement. 
#   on line 100 we reassign the local variable i to subract 1 from itself. This can also be written as i = i - 1.
#   on line 101 we use the keword break to break out of the loop if the object local variable `i` is referencing is equal to 0
# Finally, the code outputs "Hello" 3 times and returns nil. 


a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

# the local variable `a` is initialized and assigned to the integer 4

# on line 119, a loop method is called with a do..end block as an arguement
#   on line 120 the local variable `a` is reassigned to the integer 5
#   on line 121 the local variable b is initialized and assigned to the integer 3
#   then we have the break keyword to break out of the loop.
#   line 125 outputs 5 and returns nil
#   line 126 causes a method error because local variables initialized in the inner
#   scope arn't accessible in the outer scope 


a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

# on line 139 we initialize the local varialbe a to the integer 4
# on line 140 we initialize the local variable b to the integer 2
# on line 142 we invoke the loop method with a do..end block passed in as an arguement
#   on line 143 we initialize the local variable c to the integer 3
#   on line 144 we reassign the variable `a` to the variable `c` which is referencing the integer 3
#   on line 144 we have the break keyword which breaks out of the loop 

#   on line 148 we invoke the puts method with the loca variable `a` as an arguement. This outputs 3 and returns nil.
#   on line 149 we invoke the puts mehtod with the local variable `b` as an arguement. This outputs 2 and returns nil. 
#   a outputs 3 because a is reassigned in the inner scope to c. Eventhough C isn't accebile in the outer scope, the variable `a` is. 
#   This demonstrates local variable scoping rule in Ruby and how a varaible initialized in the outer scope, isa
#   accessible in the inner scope, but variables initialized in the inner scope, arn't accedssible in the outer scope. 


a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

55 4 2 

# So on line 5 we are actually assigning integer 5 to the local variable a passed 
# in as a parameter of the do..end block and the value of our local variable a 
# initialized in outer scope remains 4.

