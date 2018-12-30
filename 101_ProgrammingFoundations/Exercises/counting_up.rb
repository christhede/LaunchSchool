alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def uppercase?(string)
  string.chars.each do |x|
    alphabet.include?(x)
  end
end


uppercase?('t') # == false
uppercase?('T') # == true
uppercase?('Four Score') # == false
uppercase?('FOUR SCORE') # == true
uppercase?('4SCORE!') # == true
uppercase?('') # == true