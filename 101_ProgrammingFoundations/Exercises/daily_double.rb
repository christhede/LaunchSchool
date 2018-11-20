<<<<<<< HEAD
#def crunch(text)
#  crunch_text = ""
#  index = 0
#
#  while index <= text.length - 1
#    crunch_text << text[index] if text[index + 1] != text[index]
#    index += 1
#  end
#  puts crunch_text
#end

def crunch(text)
  crunch_text = ''
  text.each_char do |x|
    crunch_text << x if /(.)\1+/.match(x)
  end
  puts crunch_text
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

=======




crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
>>>>>>> 9cf2e92b3cce5e6991de884b50b9c06d94fe8a84
