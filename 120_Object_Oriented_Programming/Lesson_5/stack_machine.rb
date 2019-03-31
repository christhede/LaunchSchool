# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# first, create a 'register' to hold the values
# resiter = current value

require 'pry'

class Minilang
  def initialize(input)
    @input = input
    @register = 0
    @stack = []
  end

  def eval
    @input.split.map do |x|
      case x
      when 'PUSH'   then push
      when 'ADD'    then add
      when 'SUB'    then subtract
      when 'MULT'   then multiply
      when 'DIV'    then divide
      when 'MOD'    then modulo
      when 'POP'    then pop
      when 'PRINT'  then print_it
      else
        @register = x.to_i
      end
    end
  end

  def push
    @stack << @register
  end

  def add
    @register += @stack.pop
  end

  def subtract
    @register -= @stack.pop
  end

  def multiply
    @register *= @stack.pop
  end

  def divide
    @register /= @stack.pop
  end

  def modulo
    @register %= @stack.pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print_it
    puts @register
  end
end

Minilang.new('PRINT').eval
Minilang.new('5 PUSH 3 MULT PRINT')
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
Minilang.new('5 PUSH POP POP PRINT').eval
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
Minilang.new('-3 PUSH 5 SUB PRINT').eval
Minilang.new('6 PUSH').eval

