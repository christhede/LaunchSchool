items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| "#{items.join(', ')}" }

gather(items) do |items|
  items.each do |item|
    "We have #{item},"
  end
end