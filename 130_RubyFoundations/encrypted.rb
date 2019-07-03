ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ALPHA = ('A'..'z').to_a

def decrypt(string)
  string.chars.map do |letter|

    case letter
    when 'A'..'M', 'a'..'m'
      idx = ALPHA.find_index(letter)
      ALPHA[idx + 13]
    when 'N'..'Z', 'n'..'z'
      idx = ALPHA.find_index(letter)
      ALPHA[idx - 13]
    else
      ' '
    end
  end.join
end

ENCRYPTED_PIONEERS.each do |pioneer|
  puts decrypt(pioneer)
end


# first, create a hash of the value, and the correct value
# OR
# create an alphabet array
# Iterate through the word, when you come to a letter, you find out if its in the first half, or the last half of the array. If its in the first half, add 13 to the index value to find the correct letter. If its in the later half of the array, subtract 13 to find the correct value. 


# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu