def divisors(num)
  new_arr = []
  1.upto(num) { |x| new_arr << x if num % x == 0 }
  new_arr
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12)  == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# create a new array
# first, start with pushing the number into the array
# then, iterating from the number, to 0, checking to see if the number, modulo by x, results in a 0
# if it does, add it to the array.
# return the array