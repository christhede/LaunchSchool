# Input: a decimal number string or a binary string.

# output: an array of the handshake values 

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.

# - convert decimal to binary, if given an integer. Then convert the arg to seperate chars (chars)
# - reverse the array to iterate from the farthest right number first
# - setup a hash of values that can be pulled into the array
# - using each w in index.map, iterate over the array, pushing the values from hash to map when 1 is present.
# - if idx 4 is a 1, reverse the array.

LIST = [ 'wink', 'double blink', 'close your eyes', 'jump' ]

class SecretHandshake
  def initialize(arg)
    @string = arg.class == Integer ? arg.to_s(2) : arg
  end

  def commands
    return [] if invalid_string?
    list = []
    @string.to_i.digits.each_with_index do |obj, idx|
      if obj == 1 && idx == 4
        list.reverse!
      elsif obj == 1
        list << LIST[idx]
      end
    end
    list
  end

  private

  def invalid_string?
    @string =~ (/\D/)
  end
end

# handshake = SecretHandshake.new "11001111"
# p handshake.commands # => ["jump","wink"]

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]