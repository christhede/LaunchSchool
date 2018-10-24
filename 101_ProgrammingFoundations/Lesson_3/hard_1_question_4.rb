# def dot_separated_ip_address?(input_string)
#   word = []
#   # new variable assigned to input_string.split
#   dot_separated_words = input_string.split(".")
#   # while dot_separeted words is greater than 0
#   while dot_separated_words.size > 0 do
#     # word is assigned dot_separated while taking the last number off the 
#     word << dot_separated_words.pop!
#     puts word
#    break if is_an_ip_number?(word)
#   end
# end

def dot_separated_ip_address?(input_string)
  is_an_ip_number?(input_string.split("."))
end

def is_an_ip_number?(input_array)
  if input_array.length == 4
     puts "=> That is a valid ip number"
   else 
     puts "=> Invalid Number"
   end
end

#word = "171.23.15.5"

#s_an_ip_number?(word.split("."))

dot_separated_ip_address?("h.k.r.4")