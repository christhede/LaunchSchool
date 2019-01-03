def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |letter|
    if ('A'..'Z').cover?(letter)
      hash[:uppercase] += 1
    elsif ('a'..'z').cover?(letter)
      hash[:lowercase] += 1
    else
      hash[:neither] += 1
    end
  end

  calculate_percentage(hash, string)

  puts hash
end

def calculate_percentage(hash, string)
  hash.map do |key, value|
    hash[key] = value / string.chars.size.to_f * 100
  end
end

letter_percentages('abCdef 123') # == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') # == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') # == { lowercase: 0, uppercase: 0, neither: 100 }
