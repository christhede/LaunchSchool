=> Closures:
General programming concept that allows programmers to save a chunk of code and execute it at a later time. Its called a closure because its said to bind its surrounding artifacts and builds an enclosure around everything to be called upon later. You can think of a closure as a method that you can pass around and execute. In Ruby, closures are implemented in a Proc object. 

three ways of using closures in Ruby: 
1. Instantiating an object from the Proc class
2. Using lambdas
3. Using blocks

--------------------------------------

=> Blocks:
In Ruby, blocks have lenient arity rules, which is why it doesnt complain when you pass in different number of arguments; Blocks dont enfore arguemnt count

--------------------------------------

=> Proc:

--------------------------------------
	
=> lambda
Lambas are functions in Ruby that act anonmylously. 
 
  

--------------------------------------
=> Yield:
Calls the passed in block. The yield keyword executes the block.
  
#example:
def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!") { puts "world" }   

--------------------------------------
  
=> Kernel#block_given?
Checks to see if the method is given a block to run at invocation

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
  







