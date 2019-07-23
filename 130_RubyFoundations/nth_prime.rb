# write a test that can tell you what the nth prime is. 

# input: nth prime

# created an array of prime numbers

# output: outputs the nth prime from array

class Prime
  def self.nth(nth)
    raise ArgumentError if nth < 1
    count = 2
    primes = []
    loop do
      break if primes.size == nth
      primes << count if prime?(count)
      count += 1
    end
    primes.last
  end

  def self.prime?(num)
    sqrt = Integer.sqrt(num)
    (2..sqrt).all? { |x| num % x != 0 }
  end
end

# p Prime.nth()



# primes(10)


# def prime?(num)
#   arr = (2..num-1).to_a
#   count = 0
#   loop do
#     # iterate through the arr
#     # if num % arr[count] != 0, 
#       # then delete all other multiples of arr[count] to shorten arr.
#       # next if 
#       # start iterating through arr again.
#     # else
#       return false # then it is not prime
#     # end






#     placeholder = arr[count]
#     if num % placeholder != 0
#       arr.delete_if {|x| x % placeholder == 0 }
#       next
#     else
#       count += 1
#     end
#   end
# end