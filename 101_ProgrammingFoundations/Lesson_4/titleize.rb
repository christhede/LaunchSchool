words = "the flintstones rock"

p words.split.map(&:capitalize).join(' ')

p words.split.map { |x| x.capitalize}.join(' ')