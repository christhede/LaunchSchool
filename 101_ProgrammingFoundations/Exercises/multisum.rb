def multisum(number)
  new_array = 0

  (1..number).select do |x|
    if x % 3 == 0 || x % 5 == 0
      new_array += x
    end
  end
  p new_array
end

multisum(3) 
multisum(5) 
multisum(10) 
multisum(1000) 