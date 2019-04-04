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

class EmptyStackError < StandardError; end
class InvalidToken < StandardError; end

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
        raise InvalidToken.new("InvalidToken: #{x}") unless x.to_i.to_s == x
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
    raise EmptyStackError.new("Empty stack!") if @stack.empty?
    @register = @stack.pop
  end

  def print_it
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

