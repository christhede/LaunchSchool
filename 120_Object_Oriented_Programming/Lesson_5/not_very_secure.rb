# At least one character ("" is not valid)
# Allowed characters are uppercase / lowercase latin letters and digits from 0 to 9
# No whitespaces/underscore

def alphanumeric?(string)
	string.chars.each {|x| x.include? /\h/ }
end

puts alphanumeric?("HELLOworld123")

"HELLOworld123".chars.all? {|x| ([0-9a-fA-F]).cover? x}
