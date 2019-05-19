>> Closures:
# General programming concept that allows programmers to save a chunk of code and execute it at a later time. Its called a closure because its said to bind its surrounding artifacts and builds an enclosure around everything to be called upon later. You can think of a closure as a method that you can pass around and execute. In Ruby, closures are implemented in a Proc object. 

# three ways of using closures in Ruby: 
# 1. Instantiating an object from the Proc class
# 2. Using lambdas
# 3. Using blocks

--------------------------------------
>> Blocks
# In Ruby, method blocks have lenient arity rules, which is why it doesnt complain when you pass in different number of arguments; Method Blocks dont enfore arguement count

# Adding blocks to methods gives the method extra functionality. You can call the method while passing in different information to the block.
    
# Blocks are one way to implement a closure in Ruby. Closures are a way to pass around chunks of code. Blocks can take arguments, just like regular methods. Unlike regular methods, it wont complain about the wrong number of arguments passed in. Blocks return a value, just like normal methods. Blocks are a way to defer information decisions until invocation time. It allows method callers to refine the method for a specific use case. Allows for multi-functional method building. Good for sandwich code scenarios, like closing a Fileautomatically.

--------------------------------------

>> Proc:
# Procs are chunks of code that can be executed anywhere. 

--------------------------------------

>> Lambda
# Lambas are functions in Ruby that act anonmylously. 
 
  

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

>> Test Suite
# All of the tests for the project that accompanies your program or application. 

>> Test
# A situation or context in which tests are run. For Example, this test is about making sure you receive an error message when typing in the wrong password. A test can contain multiple assertions. 

>> Assertion
# This is the actual verification step to confirm that the data returned by your program or application is needed what is expected. You make one or more assertions within a test. 

--------------------------------------

>> assert_equal
# takes on two parameters. The first is the expected value, and the second is the test or actual value. If theres a descrepency, assert_equal will save that error and Minitest will report that error. This is the most common assertion. 

# example:
assert_equal(4, car.wheels)

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
# 3. Asser the results of the execution
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

>> Code Coverage

