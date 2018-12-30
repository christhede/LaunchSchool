def center_of(string)
  count = string.chars.count
  middle_num = count / 2
  if count.odd?
    p string.chars[middle_num]
  else 
    p string.chars[(middle_num - 1)..middle_num].join
  end
end


center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
center_of('four') == 'ou'