# ask the user for two numbers
# ask the user for an operation
# perform the operatuon on the two numbers
# output the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(messege)
  puts "=> #{messege}"
end

def valid_number?(num)
  if num >= 0 || num <= 0
    num 
  end
end

def number?(input)
  input.to_i.to_f == input
end


def operation_to_messege(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    return "Dividing"
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  num1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    num1 = gets.chomp.to_i
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['valid_numer'])
    end
  end

  num2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    num2 = gets.chomp.to_i

    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['valid_numer'])
    end
  end

  operator_prompt = <<-ABC
  What operation should we perfom?
  1) Add
  2) Subtract
  3) Mutiply
  4) Divide
  ABC

  prompt(MESSAGES['operation'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      puts "Must choose 1, 2, 3, or 4"
    end
  end

  prompt("#{operation_to_messege(operator)} the two numbers")

  result = case operator
           when '1'
             num1 + num2
           when '2'
             num1 - num2
           when '3'
             num1 * num2
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you!")
