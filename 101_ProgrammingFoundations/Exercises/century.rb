def century(year)
  current_century = year.to_f / 100.0
  new_century = current_century.ceil.to_s

  if new_century.end_with?('1')
    puts new_century + 'st'
  elsif new_century.end_with?('2')
    puts new_century + 'nd'
  elsif new_century.end_with?('3')
    puts new_century + 'rd'
  elsif new_century.end_with?('4', '5', '6', '7', '8', '9', '0')
    puts new_century + 'th'
  end
end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(101_03) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(112_01) == '113th'
