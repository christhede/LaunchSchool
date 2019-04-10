# Given a list lst and a number N, create a new list that contains each 
# number of lst at most N times without reordering. For example if N = 2, 
# and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next 
# [1,2] since this would lead to 1 and 2 being in the result 3 times, and 
# then take 3, which leads to [1,2,3,1,2,3].

# lst = list
# n = num

# new_list
# inputs: 
  # an array of number
  # an integer 'n'

# create new_arr variable to store numbers
# first, create a hash with values set to 0.
# to keep track of how many of each number we have come accross,
# use #each to iterating through 'lst', add += 1 to hsh value with
# hsh[x] += 1
# if hsh[x] < 3, push to new_arr
# else, nil 
# return new_arr when iteration complete

# outputs: 
  # a new list, with at most 'n' occurances of every number, without reordering.

def delete_nth(order, max_e)
  new_arr = []
  hsh = Hash.new(0)

  order.each do |x|
    hsh[x] += 1
    new_arr << x if hsh[x] <= max_e
  end

  p new_arr
end

delete_nth([1,1,3,3,7,2,2,2,2], 3)
delete_nth([20,37,20,21], 1)
