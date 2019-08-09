Closures and scope

>> Closures:
# General programming concept that allows programmers to save a chunk of code and execute it at a later time. Its called a closure because its said to bind its surrounding artifacts and builds an enclosure around everything to be called upon later. You can think of a closure as a method that you can pass around and execute. In Ruby, closures are implemented in a Proc object. 

# three ways of using closures in Ruby (or Proc objects):
# 1. Instantiating an object from the Proc class
# 2. Using lambdas
# 3. Using blocks

--------------------------------------

How blocks work, and when we want to use them.

>> Blocks
# In Ruby, method blocks have lenient arity rules, which is why it doesnt complain when you pass in different number of arguments; Method Blocks dont enfore arguement count

# Adding blocks to methods gives the method extra functionality. You can call the method while passing in different information to the block.
    
# Blocks are one way to implement a closure in Ruby. Closures are a way to pass around chunks of code. Blocks can take arguments, just like regular methods. Unlike regular methods, it wont complain about the wrong number of arguments passed in. Blocks return a value, just like normal methods. Blocks are a way to defer information decisions until invocation time. It allows method callers to refine the method for a specific use case. Allows for multi-functional method building. Good for sandwich code scenarios, like closing a File automatically.

# Two main use cases are:
# 1. Defer some implementation code to method invocation decision.
# 2. Methods that need to perform some "before" and "after" actions - sandwich code.

--------------------------------------

Blocks and variable scope

--------------------------------------

Write methods that use blocks and procs

--------------------------------------

Methods with an explicit block parameter
  
>> Methods with Explicit Block Parameters
# Explicit block paramets have an & symbol infront of the parameter. The & symbol converts the block parameter into a simple proc object. We drop the & symbol when referencing the parameter in the code.Ruby converts explicit blocks into simple Proc objects. You invoke those proc objects with the 'call' method. It provides extra flexibility.
  
#example:

def test2(block)
  puts "hello"
  block.call                    # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2

--------------------------------------

Arguments and return values with blocks

# blocks return a value, just like normal methods.

--------------------------------------

When can you pass a block to a method

# When the method calls for extra functionality.
# blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.

# blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.

# blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.


--------------------------------------

&:symbol

--------------------------------------

class House
  def self.House
    new.recite
  end

  def recite
    'outputs to the screen'
  end
end

House.recite


