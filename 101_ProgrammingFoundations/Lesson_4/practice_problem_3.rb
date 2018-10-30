ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each do |key, value|
  if value > 100
    ages.delete(key)
  end
end

puts ages
