def sum_square_difference(num)
  1.upto(num).inject(:+)**2 - 1.upto(num).inject { |sum, n| sum + n**2 }
end

# puts sum_square_difference(3) #== 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# puts sum_square_difference(10) #== 2640
# puts sum_square_difference(1) #== 0
# puts sum_square_difference(100) # == 25164150
