# # Letter                           Value
# # A, E, I, O, U, L, N, R, S, T       1
# # D, G                               2
# # B, C, M, P                         3
# # F, H, V, W, Y                      4
# # K                                  5
# # J, X                               8
# # Q, Z                               10

# - create a hash to hold onto each letter and their Value
# - create a holder for the value of the word to add upon.
# - split the word into characters and iterate over them with each, adding the value of each letter to holder
# - return the holder value after iteration

# require 'pry'

# ALPHA = { one: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
#           two: ['D', 'G'],
#           three: ['B', 'C', 'M', 'P'],
#           four: ['F', 'H', 'V', 'W', 'Y'],
#           five: ['K'],
#           eight: ['J', 'K'],
#           ten: ['Q', 'Z'] 
#         }

class ScrambleScore
  def initialize(word)
    @word = word
  end

  def calculate_score
    score = 0

    @word.upcase.chars.each do |x|
      case
      when %w(A E I O U L N R S T).include?(x)
        score += 1
      when %w(D G).include?(x)
        score += 2
      when %w(B C M P).include?(x)
        score += 3
      when %w(F H V W Y).include?(x)
        score += 4
      when %w(K).include?(x)
        score += 5
      when %w(J K).include?(x)
        score += 8
      when %w(Q Z).include?(x)
        score += 10
      end
    end

    score
  end
end

# oops = ScrambleScore.new("cabbage")
# p oops.calculate_score


# alpha = { A: 1,
#           B: 3,
#           C: 3, 
#           D: 2,
#           E: 1,
#           F: 4,
#           G: 2.
#           H: 4,
#           I: 
#           J: 
#           K:
#           L:
#           M:
#           N:
#           O:
#           P:
#           Q:
#           R:
#           S:
#           T:
#           U:
#           V:
#           W:
#           X:
#           Y:
#           Z: 10}
