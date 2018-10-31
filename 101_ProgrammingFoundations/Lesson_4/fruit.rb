produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
	produce_keys = produce_list.keys # calling all of the keys
	selected_fruits = {} # empty hash
	counter = 0 # counter at 0

	loop do

		break if counter == produce_list.size

		current_key = produce_keys[counter] # current_key = the first key in produce_keys
		current_value = produce_list[current_key] # current_value = the value from current_key

		if current_value == 'Fruit'
			selected_fruits[current_key] = current_value
		end
		
		counter += 1
	end
	puts selected_fruits
end

select_fruit(produce)

