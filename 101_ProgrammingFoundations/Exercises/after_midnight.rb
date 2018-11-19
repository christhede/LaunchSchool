MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(delta_minutes)
  if delta_minutes != "24:00"
    hour = delta_minutes[0..1].to_i
    minute = delta_minutes[3..4].to_i
    puts total_minutes = (hour * MINUTES_PER_HOUR) + minute
  else 
    puts 0
  end
end

def before_midnight(delta_minutes)
  if delta_minutes != "00:00"
    hour = delta_minutes[0..1].to_i
    minute = delta_minutes[3..4].to_i
    total_minutes = (hour * MINUTES_PER_HOUR) + minute
    puts 1440 - total_minutes
  else 
    puts 0
  end
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0