class Example
  attr_reader :something

  def initialize
    @something = ['']
  end

  def print_something
    if something.size
      puts "something has just 1 item: #{@something[0]}"
    elsif something.size.empty?
      puts "something has 2 items: #{@something[0]} #{@something[1]}"
    else
      puts "something has #{@something.size} items: #{@something.join(' ')}"
    end
  end
end
