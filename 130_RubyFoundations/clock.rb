class Clock
  attr_accessor :hour, :minute

  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60
  
  def initialize(hour = 0, minute = 0)
    @hour = hour.to_i
    @minute = minute.to_i
    normalize
  end

  class << Clock
    alias_method :at, :new
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(minutes_to_add)
    Clock.new(hour, minute + minutes_to_add)
  end

  def -(minutes_to_subtract)
    Clock.new(hour, minute - minutes_to_subtract)
  end

  def in_minutes
    hour * MINUTES_IN_HOUR + minute
  end

  def ==(other)
    in_minutes == other.in_minutes
  end

  private

  def normalize
    @hour = in_minutes / MINUTES_IN_HOUR % HOURS_IN_DAY
    @minute = in_minutes % MINUTES_IN_HOUR
  end
end

phone = Clock.at(0, 30) - 60
p phone.to_s
# p phone.minute
# p phone.hour

# hours = 00..23
# minutes = 00..59

# if minutes are 0, 
#   subtract from 60, 