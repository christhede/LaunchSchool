UPCASE = ('A'..'Z')
LOWCASE = ('a'..'z')

def swapcase(string)
  a = string.chars.map do |x|
    if (UPCASE).include?(x)
      x.downcase
    else 
      x.upcase
    end
  end
  puts a.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'