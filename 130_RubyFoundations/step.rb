def step(start_point, end_point, increment)
  count = start_point
  start_point.upto(end_point) do |_|
    yield(count)
    count += increment
    break if count > end_point
  end
  count
end


step(0, 20, 10) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10