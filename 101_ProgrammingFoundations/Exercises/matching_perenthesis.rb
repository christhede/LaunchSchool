PERENTHESIS = ['(', ')']

def balanced?(string)
  parens = 0
  string.each_char do |x|
    parens += 1 if x == '('
    parens -= 1 if x == ')'
    break if parens < 0
  end
  puts parens.zero?
end

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false