# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value


def minilang(string)
  register = 0
  stack = []

  string.split.each do |x|
    case x
    when 'PUSH'
      stack << register
    when 'SUB'
      register = stack.pop - register
    when 'MULT'
      register = stack.pop * register
    when 'DIV'
      register = stack.pop / register
    when 'MOD'
      register = stack.pop % register
    when 'POP'
      register << stack.pop
    end
  end
end

