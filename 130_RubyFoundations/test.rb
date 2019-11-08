

# first, check to see what letter it is,
# if letter is from 'A' - 'M' + 13 to reverse it, 
# 	if letter is from 'N' - 'Z' - 13 to reverse it. 
# 		then, get the ordinal number from Letter with 'Letter'.ord.
# 		take that number and add or subtract 13 from it. 
# 		then, take that added number, and use num.chr to find the letter
# 		add that letter to the string, continue on to next char. 



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
]


def decrpyt_rot13(name)

	name.chars.map do |x|
		if ('A'..'M').include?(x) || ('a'..'m').include?(x)
			(x.ord + 13).chr
		elsif ('N'..'Z').include?(x) || ('n'..'z').include?(x)
			(x.ord - 13).chr
		else
			x
		end
	end.join
end

ENCRYPTED_PIONEERS.each { |name| p decrpyt_rot13(name) }



