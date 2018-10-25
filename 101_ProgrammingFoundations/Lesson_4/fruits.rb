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
    keys = str.keys[counter]
    values = str.values[counter]

    if values.include?("Fruit")
      selected_fruit << {keys => values}
    end

    counter += 1
    break if counter == str.size
  end
  puts selected_fruit
end
      

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
