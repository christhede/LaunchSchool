[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |inner_array|
  incremented_hash = {}
  inner_array.each do |key, value|
   incremented_hash[key] = value + 1
  end
  puts incremented_hash
end