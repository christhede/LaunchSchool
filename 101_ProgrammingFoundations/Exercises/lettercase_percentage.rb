require 'pry'
HASH = { lowercase: 0, uppercase: 0, neither: 0 }

def letter_percentages(string)
  string.chars.each do |letter|
    if ('A'..'Z').include?(letter)
      uppercase += 1
    elsif ('a'..'z').include?(letter)
      HASH[:lowercase] += 1
    else 
      HASH[:neither] += 1
    end
  end

  HASH.map do |word|
    word = word / string.chars.size.to_f
  end
  puts HASH
end



# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }