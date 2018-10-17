def prompt(message)
  puts "=> #{message}"
end

prompt("What is the bill?")
amount = gets.chomp.to_f

prompt("What is the tip percentage? ie. 15 = 15%")
tip_percentage = gets.chomp.to_f / 100 

tip_amount = (amount * tip_percentage).round(2)
total = (amount + tip_amount).round(2)

prompt("The tip is $#{tip_amount}")

prompt("The total is ##{total}")