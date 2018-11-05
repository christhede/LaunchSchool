munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |name, details|

	case 
	when (0..17).include?(munsters[name]["age"])
		munsters[name][:age_group] = "Kid"
	when (18..64).include?(munsters[name]["age"])
		munsters[name][:age_group] = "Adult"
	else
		munsters[name][:age_group] = "Senior"
	end

end

p munsters

munsters.each do |name, details|
	case details ["age"]
	when 0..17
		details[:age_group] = "Kid"
	when 18..64
		details[:age_group] = "Adult"
	else 
		details[:age_group] = "Senior"
	end
end


