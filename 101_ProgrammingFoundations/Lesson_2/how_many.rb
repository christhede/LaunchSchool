vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  occurances = {}

  array.each do |element|
    occurances[element] = array.count(element)
  end
  puts occurances
  
  occurances.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)


#{ car = number.count('car')
 #  truck = number.count('truck')
  # motorcycle = number.count('motorcycle')
   #suv = number.count('SUV')
   #puts "car => #{car}"
   #puts "truck => #{truck}"
   #puts "motorcycle => #{motorcycle}"
   #puts "SUV => #{suv}"}