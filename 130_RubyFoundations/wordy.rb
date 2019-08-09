# input: a string of words and numbers

# first, create a hash to hold the math equations.
total = 0
OPERS = { 'multiplied': '*',
              'divided': '/',
              'plus': '+',
              'minus': '-' } 

class WordProblem
  def initialize(string)
    @str = create_string(string)
  end

  def answer
    count = 0
    total = @str[count]
    until count >= @str.size-1
      total = total.to_i.send @str[count+1], @str[count+2].to_i
      count += 2
    end
    total
  end

  private

  def create_string(string)
    arr = []
    string.split.each do |x|
      if OPERS[x.to_sym]
        arr << OPERS[x.to_sym]
      elsif x.match?(/\b[\d]+\b/)
        arr << x.gsub('?', '')
      end
    end
    raise ArgumentError if arr.size < 3
    arr
  end
end

# p operators.keys.include?('plus'.to_sym)
p WordProblem.new('What is 1 plus 1?').answer

p WordProblem.new('What is 20 minus 4 minus 13?').answer
p WordProblem.new('What is -3 plus 7 multiplied by -2?').answer

# 1.send 