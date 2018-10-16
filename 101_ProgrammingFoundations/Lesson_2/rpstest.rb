
VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

DEFEATS = { "Scissors": ["Paper", "Lizard"],
         "Paper": ["Rock", "Spock"],
         "Rock": ["Lizard", "Paper"],
         "Spock": ["Scissors", "Rock"],
         "Lizard": ["Spock", "Paper"] }

def win?(first, second)
  VALID_CHOICES.include?(first) && DEFEATS[first.intern].include?(second)
end

puts win?("Scissors", "Paper")

puts "Scissors".intern == :Scissors