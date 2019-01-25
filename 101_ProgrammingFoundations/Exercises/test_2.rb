greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

On line 1 the local variable `greeting` is initialized and assigned to the string object 'Hello'
From lines 3 - 6. The loop method is invoked with a `do..end` block passed in as an arguemnt.
Within that, on line 4, the local variable `greeting` is reassigned to the string object 'Hi'. 
On line 5 we have a break object
On line 8 we hava the puts method that passes the method `greeting` in as its arguement. 
The string object 'Hi' is printed to the screen because it was reassigned in the block on line 4
