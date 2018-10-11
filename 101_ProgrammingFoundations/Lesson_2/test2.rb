def append(s)
  s << '*'
end

t = 'abc'
puts t
puts append(t)    # prints abc*
puts t            # prints abc*