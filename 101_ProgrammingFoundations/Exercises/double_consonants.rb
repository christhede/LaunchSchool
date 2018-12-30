CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.chars.each do |char|
    if CONSONANTS.include?(char.downcase)
      result << char * 2
    else 
      result << char
    end
  end
  puts result
end

double_consonants('String') # == "SSttrrinngg"
double_consonants("Hello-World!") # == "HHellllo-WWorrlldd!"
double_consonants("July 4th") # == "JJullyy 4tthh"
double_consonants('') # == ""