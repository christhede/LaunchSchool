# before all this, find out if there is only one number in num, other than 0s. if yes, move that single num to the -1 position.

# first, iterate through the number, after using chars and each, to find the smallest number in the group.
# Once found, place the smallest number at the front of the array. if the smallest number is already at the front of num,
# find the second smallest num, and move it to position 1. 
require 'pry'

def smallest(number)
  num = number.digits.reverse
  if num.include?(0) && num.uniq.size == 2
     num << num.delete(num.max)
     num.join.to_i

  else
    minimum = num.min
    idx = 0
    loop do 
      if minimum != num[idx]
        num.unshift(num.delete(num.min))
        break
      elsif idx + 1 == minimum + 1
        

      end
    end

    # num.each do
    #   if num.count(minimum) == 1 && minimum == num[idx]
    #     binding.pry
    #     next
    #   else
    #     num.insert(idx, num.delete(num[minimum]))
        
    #     break
    #   end

    #   minimum += 1
    #   idx += 1
    # end

  end

  p num
end

smallest(261235)
smallest(10000)