numbers = [1, 2, 3, 4, 5, 6]

def joinor(num, punc = ', ', op = 'or ')
  if num.count <= 2 
    puts num.join(" #{op}")
  else
  puts num.join("#{punc}").insert(-2, op)
end
end

joinor([1, 2, 3, 4])

# empty_squares(brd).join(', ')