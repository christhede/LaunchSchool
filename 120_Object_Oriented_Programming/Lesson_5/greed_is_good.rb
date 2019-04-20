 # Three 1's => 1000 points
 # Three 6's =>  600 points
 # Three 5's =>  500 points
 # Three 4's =>  400 points
 # Three 3's =>  300 points
 # Three 2's =>  200 points
 # One   1   =>  100 points
 # One   5   =>   50 point

 #  Throw       Score
 # ---------   ------------------
 # 5 1 3 4 1   50 + 2 * 100 = 250
 # 1 1 1 3 1   1000 + 100 = 1100
 # 2 4 4 5 4   400 + 50 = 450

 # first, create a dice to roll and returns a random number from 1-6
# use a case statement create the scoring rules

# first, check to see if the array holds 3 of the same number, if it does,
# add that number to the running total variable

# then, check to see if there is more than 3 of a 1 or a 5, if yes, 
# add the proceeding number to the running total

require 'pry'

def dice_roll
  (0..6).to_a.sample
end

def create_dice_values
  dice_array = []
  5.times { dice_array << dice_roll }
  dice_array
end

THREE_NUM = {
  1 => 1000,
  2 => 200,
  3 => 300,
  4 => 400,
  5 => 500,
  6 => 600
}

ONE_NUM = {
  1 => 100,
  5 => 50
}

def score(dice_values)
  total = 0
  num_count = Hash.new(0)
  dice_values.each { |x| num_count[x] += 1 }

  num_count.each do |k, v|
    binding.pry
    if v >= 3
      total += THREE_NUM.fetch(k)
      (v-3).times { total += ONE_NUM.fetch(k) } if k == 1 || k == 5
    elsif k == 1 || k == 5
      v.times { total += ONE_NUM.fetch(k) }
    end
  end

  total
end



puts score([3, 3, 3, 3, 3])
puts score([2, 3, 4, 6, 2])
puts score([2, 2, 2, 1, 1])

