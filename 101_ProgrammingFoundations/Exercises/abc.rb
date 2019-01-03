BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.all? do |block|
    up_string.include?(block[0]) && up_string.include?(block[1]) ? false : true
  end
end

puts block_word?('BATCH') # == true
puts block_word?('BUTCH') # == false
puts block_word?('jest')
puts block_word?('boob') # == true