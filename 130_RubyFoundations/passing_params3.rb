items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*vegetables, grain|
  puts vegetables
  puts grain
end

gather(items) do |apples, *others, grain|
  puts apples
  p others
  puts grain
end

gather(items) do |vegetables, *grain|
  p vegetables
  p grain
end

gather(items) do |_, _, _, *veggies|
  puts veggies
end