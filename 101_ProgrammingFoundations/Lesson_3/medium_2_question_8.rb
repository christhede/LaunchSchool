munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  # munsters gets passed through demo
  # values is iterated through
  demo_hash.values.each do |family_member|
    # family members age had 42 added to it
    family_member["age"] += 42
    # family_members gender was switched to "other"
    family_member["gender"] = "other"
  end
end

puts mess_with_demographics(munsters)
