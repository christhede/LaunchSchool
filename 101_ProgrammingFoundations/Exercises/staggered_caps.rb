require 'pry'
def staggered_case(string)
  index = 0
  result = ''

  string.chars.each do |char|
      if index.odd?
        result += char.upcase
      elsif index.even?
        result += char.downcase
      else
        char
      end     
    index += 1
  end
  puts result
end

staggered_case('I Love Launch School!') # == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') # == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 NuMbErS'