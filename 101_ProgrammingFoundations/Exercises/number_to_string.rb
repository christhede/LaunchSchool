def integer_to_string(integer)
array = []

  while integer > 0
    x = integer % 10
    integer /= 10
    array << x
  end
  
array.reverse.join
end

integer_to_string(4321)
# integer_to_string(0)
# integer_to_string(5000)