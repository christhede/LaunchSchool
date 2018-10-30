def leap_year?(year)
  if year >= 1752 
    if (year % 400).zero?
      puts true
    elsif (year % 100).zero?
      puts false
    else
     puts (year % 4).zero?
    end
  else 
    puts (year % 4).zero?
  end
end

leap_year?(2016) # == true
leap_year?(2015) # == false
leap_year?(2100) # == false
leap_year?(2400) # == true
leap_year?(240_000) # == true
leap_year?(240_001) # == false
leap_year?(2000) # == true
leap_year?(1900) # == false
leap_year?(1752) # == true
leap_year?(1700) # == true
leap_year?(1) # == false
leap_year?(100) # == true
leap_year?(400) # == true
