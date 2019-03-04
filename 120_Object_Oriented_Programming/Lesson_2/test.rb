def weighted_random_selection
  values = {'rock' => 0.20,
          'paper' => 0.20,
          'scissors' => 0.10, 
          'spock' => 0.20,
          'lizard' => 0.20}

  total_weight = values.values.sum
  random_weight = rand(0.0..total_weight)
  p random_weight
  values.each do |item, weight|
    random_weight = random_weight - weight
    p random_weight
    break item if random_weight <= 0
  end
end

p weighted_random_selection