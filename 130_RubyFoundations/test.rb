# # Proc example
# my_proc = proc { |thing| puts "This is a #{thing}." }
# my_proc.call # returns 'This is a .'
# my_proc.call('cat') # returns 'This is a cat.'
# my_proc.call('cat', 'mouse') # returns 'This is a cat.'

# my_second_proc = Proc.new { |thing| puts "This is a #{thing}." } # a different proc syntax
# my_second_proc.call # returns 'This is a .'
# my_second_proc.call('dog') # returns 'This is a dog.'

# # Lamda examples
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_lambda.call # returns ArgumentError
# my_lambda.call('dog') # reuturns 'This is a dog.'
# my_lambda.call('dog', 'mouse') # returns ArguementError

# my_second_lambda = -> (thing) { puts "This is a #{thing}." } # a different lambda syntax
# my_second_lambda.call # returns ArguementError
# my_second_lambda.call('bird') # returns 'This is a bird'
# my_second_lambda.call('bird', 'moose') # returns ArguementError


# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # returns 'This is a .' Yield did not acccept arg
# block_method_1('seal') # returns LocalJumpError - No block given

# Group 4
def block_method_2(animal, seal)
  yield(animal, seal)
end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # returns 'This is a turtle.'
block_method_2('turtle', 'seal') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}