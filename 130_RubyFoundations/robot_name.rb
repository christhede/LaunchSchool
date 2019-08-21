# create a machine that develops robot names


class Robot
  attr_reader :name

  @@used_names = []

  def initialize
    @name = create_name
    @@used_names << @name
  end

  def reset
    @@used_names.delete(@name)
    @name = create_name
  end

  private

  def create_name
    name = ''
    loop do
      name = [*'AA'..'ZZ'].sample.concat([*'000'..'999'].sample)
      break unless @@used_names.include? name
    end
    name
  end
end

# bot = Robot.new
# p bot.name

# skip = Robot.new
# p skip.name

# rufus = Robot.new
# p rufus.name

# bill = Robot.new
# p bill.name

# p Robot.used_names
