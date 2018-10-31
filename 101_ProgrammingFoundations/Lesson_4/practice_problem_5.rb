flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

arr = []
flintstones.each_with_index do |item, index|
	if item.include?("Be")
		arr << index
	end
end

puts arr
