# madeup_method is referenced here but not invoked so it doesn't matter if it exists or not
my_proc = Proc.new { madeup_method }

# we then define a method called madeup_method

def madeup_method
  puts 'Hello!'
end

# now when we call the Proc madeup_method is invoked, outputting the String 'Hello!'
my_proc.call # => 'Hello!'