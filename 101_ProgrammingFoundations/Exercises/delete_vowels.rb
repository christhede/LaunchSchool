def remove_vowels(text)
   text.map do |x|
    x.gsub(/[aeiouAEIOU]/, '')
    end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))# == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white))# == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ))# == ['BC', '', 'XYZ']