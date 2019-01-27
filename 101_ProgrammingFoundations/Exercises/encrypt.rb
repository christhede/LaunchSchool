# For building the encrypted string:
# Take every 2nd char from the string, then the other chars, 
# that are not every 2nd char, and concat them as new String.
# Do this n times!

# loop n amount of times
# take every second character, put it in a new string
  # iterate through text, pulling the second characters out
# take the remaining characters and concat them with new string
# end loop 



require 'pry'

# def encrypt(text, n)
#   counter = 1
#   new_string = ''
#   new_text = text

#   n.times do

#     loop do
#       # new_string << text.slice!(counter)
#       # counter += 2
#       # break if counter >= text.size
#       # # binding.pry
#     end

#     counter = 2
#   end

#   text << new_string
# end

# def encrypt(text, n)
#   odds = ''
#   evens = ''
#   counter = 0

#   n.times do
#     text.chars.each do |x|

#       if counter.even?
#         evens << x
#       else
#         odds << x
#       end
#       counter += 1
#       # binding.pry
#     end

#     text = odds << evens
#     odds = ''
#     evens = ''
#   end

#   text
# end

def encrypt(text, n)
  odds = ''
  evens = ''

  n.times do 
    text.chars.each_with_index do |item, index|
      if index.odd?
        odds << item
      else
        evens << item
      end
    end

    text = odds << evens
    odds = ''
    evens = ''
  end

  text
end

def decrypt(encrypted_text, n)
  str1 = []
  str2 = []

  n.times do 
    encrypted_text = encrypted_text.chars
    middle_num = encrypted_text.size / 2 - 1
    str1 = encrypted_text[0..middle_num]
    str2 = encrypted_text[(middle_num+1)..-1]

    encrypted_text = str2.zip(str1).flatten.join
    str1 = []
    str2 = []
  end
  encrypted_text
end


# puts encrypt("This is a test!", 1)
# puts decrypt("hsi  etTi sats!", 1)
puts decrypt("s eT ashi tist!", 2)
puts decrypt(" Tah itse sits!", 3)

# "This is a test!", 1), "hsi  etTi sats!") 
# 2 => "s eT ashi tist!"