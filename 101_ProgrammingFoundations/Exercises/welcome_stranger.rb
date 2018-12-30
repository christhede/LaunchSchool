def greetings(name, status)
  puts "Hello, #{name.join(' ')}! Nice to have a\
       #{status[:title]} #{status[:occupation]} around"
end

greetings(%w(John Q Doe), title: 'Master', occupation: 'Plumber')
# => Hello, John Q Doe! Nice to have a Master Plumber around.
