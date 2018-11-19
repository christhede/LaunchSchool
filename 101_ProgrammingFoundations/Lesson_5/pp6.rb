<<<<<<< HEAD
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = %w(a e i o u)
hsh.each do |name, details|
   details.each do |x|
    x.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
=======
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is #{details['age']}-year-old #{details['gender']}"
>>>>>>> a495bb4e7363c19f1c59c2041dde89c56857c079
end
