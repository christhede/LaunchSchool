# mortgage_calculator.rb

def prompt(input)
  puts "=> #{input}"
end

def valid_number?(num)
  if num > 0
    num
  end
end

p = ''
loop do
  prompt("What is your loan amount?")
  p = gets.chomp.to_i.to_f
  if valid_number?(p)
    break
  else
    prompt("Please put in a valid loan amount")
  end
end

j = ''
loop do
  prompt("What is the Annual Percentage Rate? (eg. 5% = 0.05)")
  j = gets.chomp.to_f / 12
  if valid_number?(j)
    break
  else
    prompt("Please put in a valid interest rate")
  end
end

prompt("How long is the duration of the loan? (number of months)")

n = ''
loop do
  n = gets.chomp.to_f
  if valid_number?(n)
    break
  else
    prompt("Please put in a valid loan duration: (number of months)")
  end
end

prompt("calculating...")
sleep 2

m = p * (j / (1 - (1 + j)**-n))

prompt("Your monthly payment will be $#{m.round(2)}")
