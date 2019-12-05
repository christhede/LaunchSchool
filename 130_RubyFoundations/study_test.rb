>> MiniTest vs. RSpec

Minitest uses a more straight forward syntax than Rspec. Rpec can also have many lines of code for the same tests as minitest. We use Minitest because it reads like natural Ruby code. 

Expectation Style: mimics Rspec syntax
Assertion Style: mimics Minitest syntax

require 'minitest/autorun'

require_relative 'car' #requires the file named car.rb from our folder

class CarTest < MiniTest::Test #need MiniTest::Test to be inherited
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end

Line 8: Loads all the required files for the minitest gem to run
Line 10: Requires the file that we are testing, car.rb 
Line 12: CarTest is a subclass of MiniTest::Test, so that it inherits all necessary methods
Line 13: We create an instance method for each test beginning with 'test_'
Line 14: We create instantiate a 'Car' object.
Line 15: we use the assert_equal method to determine if '4' is equal to 'car.wheels'. assert_equal uses the '#==' method. 

--------------------------------------

>> SEAT Approach
# 1. Setup the necessary objects
# 2. Execute the code against the object were testing
# 3. Assert the results of the execution
# 4. Tear down and cleanup any lingering artifacts

--------------------------------------

>> Assertions
This is the actual verification step to confirm that the data returned by your program or application is needed what is expected. You make one or more assertions per test. 

assert_equal:
'assert_equal(exp, act)' uses the '#==' method to check if its arguements 'exp' and 'act' are of equal values like so: 'exp == act'

assert_same:
'assert_same(exp, act)' uses the '#equal?' method to check if the object IDs of its arguements, 'exp' and 'act' are identical.

--------------------------------------

>> Refutations
# opposite of assertions

--------------------------------------

>> Purpose of Core Tools
The core tools of ruby, 


--------------------------------------

>> Why do we write tests?

We write tests to make sure our code can pass multiple different scenarios and edge cases. This makes sure that we wont come across any unwanted bugs or unknowns while using the application in the future. In short, we test to prevent regression. It is a way of veriying that everything will still work when we want it to.

--------------------------------------

>> Block Binding
#blocks

# blocks are one way in which ruby creates a closure. The other two being procs and llambdas. 
my_hash = {a: 3, b: 2, c: 5}

def test(num)
	num += 2
end

arr = ['a', 'b', 'c']

def convert(collection)
	collection.map do |el|
		yield(el)
	end
end

convert(arr) do
	# block binding
end

# A block binding is the surrounding environment in which the block can acces and use code. On line 16, we can access everything within our block. `my_hash`, the methods `test` and `convert`, as well as the array `arr`. This is because in ruby, inner scoped blocks can access variables and methods in the outer scope. We can use any of the variablees and methods within our block to return a desired outcome. 

--------------------------------------

>> Procs



--------------------------------------

Arity Rules in Ruby

If you pass the wrong number of arguements to a block, Ruby will use the ones that are passed in that match the number of block parameters, and ignore the extra arguments. Blocks in Ruby have lenient arity rules, which is why it doesnt complain when you pass in a diffferent number of arguments. Here, yielding without an argument to the block results in the parameter `words` being nil, which results in an empty string. 

`def say
	yield
end

say { |words| puts words }` # words in this case is nil, which results in an empty string

Below, passing in one arguement to a block that takes one parameter results in the output `hello`

`def say
	yield('hello')
end

say { |words| puts words }` #outputs: hello

Passing in two arguments to a block that has one parameter wont raise an error. The extra block argument 'goodbye' is ignored.

`def say
	yield('hello', 'goodbye')
end

say { |words| puts words }` #outputs: hello

Passing in one argument, when the block requests 2 parameters wont raise an error either. Block local variable `word2` here is nil, which string interpolation converts to an empty string.

`def say
	yield('hello')
end

say do |word1, word2|
	puts {#{word1} #{word2}}
end` #outputs hello


--------------------------------------

>> Explicit block parameters using &

We use explicit block parameters when we want to pass on that block to another method so they can use it for their own implementation. By passing in an explicit block parameter, the & turns the block into a proc object which then we can pass around to other methods and have them use the Proc in whatever way they like. It adds an extra layer of functionality by being able to use the same block in different methods. We use the `#call` method directly on the argument instead of yield. In this case, were passing the same proc object to `test` and `test2` and they are each using the `#call` method with an arguement to acheive different results. 

def test2(block)
	puts 'hello'
	puts block.call('That')
end

def test(&block)
	puts block.call('This')
	test2(block)
end

p test { |n| "Here it is with #{n}" }


# Here it is with this
# hello
# Here it is with that
# nil

--------------------------------------

>> Implicit block parameters using yield


def test2(block)
	puts "#{block} #{yield('that')}"
end

def test(block)
	puts "#{block} #{yield('this')}"
end

p test("Here it is with") { |n| "#{n}" }
p test2("Here it is with") { |n| "#{n}" }


# Here it is with this
# Here it is with that

--------------------------------------

>> Symbol#to_proc 
Is a shortcut in ruby when using methods that can take blocks.

# example:
[1, 2, 3, 4, 5].map (&:to_s)

#broken down further
def map
  yield(1, 2, 3, 4, 5)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
map(&a_proc)

--------------------------------------



