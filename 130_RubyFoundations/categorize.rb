# input: an array of arrays listing each persons age and handicap
# first, iterate through the arrays, checking to see if the age of the person is 55 or over,
# if true, check to see if the handicap is greater than 7, if true, place this person in the 'senior' category.
# if one or both of these conditions are false, place in the 'open' category. 


def openOrSenior(input)
  input.map { |x| x[0] >= 55 && x[1] > 7 ? 'Senior' : 'Open' }
end



openOrSenior([[45, 12],[55,21],[19, -2],[104, 20]])