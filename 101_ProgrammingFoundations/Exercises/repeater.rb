def repeater(string)
  result = ''
  string.chars.each do |char|
    result << char * 2
  end
  puts result
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''