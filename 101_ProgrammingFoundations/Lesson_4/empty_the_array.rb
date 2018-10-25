produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(str)
  selected_fruit = []
  counter = 0

  loop do 
    current_hsh = str.values[counter]
    if current_hsh.include?("Fruit")
      current_hsh << select_fruit
    end

    counter += 1
    break if counter == str.size
end
      

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
