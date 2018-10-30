flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each_index { |word| word.start_with?('Be') }
flintstones.index { |name| puts name[0, 2] == "Be" }