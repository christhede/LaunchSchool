def joinor(array, punc = ', ', conj = 'or')
  array.map do |num|
    num == array[-1] ? "#{conj} #{num.to_s}" : "#{num.to_s}#{punc}"
  end.join
end


p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'or')