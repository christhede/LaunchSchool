def time_of_day(minutes)
  hour_digits = 24
  minute_digits = 0

  time = minutes <=> 0
  if time == +1 
    hour, minute = minutes.divmod(60)
  else 
    hour, minute = minutes.divmod(-60)
    hour_digits - hour
    minute_digits - minute

  end
  puts "#{hour_digits.abs}:#{minute_digits.abs}"
end


time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"