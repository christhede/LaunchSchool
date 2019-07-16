def format_date(string)
  p string.split(/[\/-]/).reverse.join('.')
end


format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'