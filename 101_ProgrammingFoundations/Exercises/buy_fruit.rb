def buy_fruit(array)
  new_array = []
  array.each do |fruit|
    fruit[1].times { |_| new_array << fruit[0] }
  end
  p new_array
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]