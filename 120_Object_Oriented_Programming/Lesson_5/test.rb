<<<<<<< HEAD
# For building the encrypted string:
# Take every 2nd char from the string, then the other chars, that are not every 2nd char, and concat them as new String.
# Do this n times!

# input: a string
# first, iterate through string, pushing every second char to new_string
# then join original string and new_string together with #join
# do this n times with n.times

# output: a new string

def encrypt(text, n)
  new_string = ''
  text.chars.each_with_index { |char, idx| new_string << char if idx % 2 == 0 }
  puts new_string
  puts text
end

encrypt("This is a test!", 0)
=======
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

giraffe = Animal.new
# puts giraffe.a_protected_method
puts giraffe.a_public_method
>>>>>>> 8d746b4433c97f8ad443408a8b9641e3d01a2560
