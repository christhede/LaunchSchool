ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject do |key, value|
	value >= 100
	puts ages
end

puts ages