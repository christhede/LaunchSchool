def prompt(message)
  puts "=> #{message}"
end

prompt "What is your name?"
name = gets.chomp

if name.end_with?("!")
  prompt "HELLO #{name.upcase}! WHY ARE YOU SCREAMING?"
else 
  puts "Hello #{name}."
end



