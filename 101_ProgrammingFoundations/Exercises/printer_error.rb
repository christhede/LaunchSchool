# input: string
# printer can only handle letters from a to m
# ex. control string: 'aaabbbjjgjefe'
# output: numerator (number of errors) / denomenator (length of string)

# first, split string into array with chars, to iterate over
# use a looping mechanism, such as each to iterate
# use an if statement to see if 'letter' is inlcuded in alphabet 'a..m'
# if not, then add 1 to errer variable
# at the end of iteration, return 'error / chars.size




def printer_error(str)
  errors = 0 
  str.chars.each { |x| ('a'..'m').include?(x) ? x : errors += 1 }
  "#{errors}/#{str.size}"
end



str = "aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"

p printer_error(str)