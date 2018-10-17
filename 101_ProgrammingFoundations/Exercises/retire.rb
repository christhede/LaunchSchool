def prompt(message)
  puts "=> #{message}"
end

current_year = Time.now.year

prompt "What is your age?"
current_age = gets.chomp.to_i

prompt "At what age would you like to retire?"
retire_age = gets.chomp.to_i

prompt "It's #{current_year}, you will retire in #{current_year + (retire_age - current_age)}"
prompt "You only have #{retire_age - current_age} years left to go!"

