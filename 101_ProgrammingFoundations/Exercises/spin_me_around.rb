def print_in_box(text)
  puts '+' + '-' + '-' * text.length + '-' + '+'
  puts '|' + ' ' * text.length + '  ' + '|'
  puts '|' + ' ' + text + ' ' + '|'
  puts '|' + ' ' * text.length + '  ' + '|'
  puts '+' + '-' + '-' * text.length + '-' + '+'
end


print_in_box('To boldly go where no one has gone before.')
print_in_box('Boobies')