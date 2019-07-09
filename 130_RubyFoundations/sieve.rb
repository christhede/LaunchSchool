class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    primes = (2..@number).to_a
    idx = 0

    until idx == primes.size
      counter = primes[idx]
      primes.delete_if {|x| x % counter == 0 && x != counter }
      idx += 1
    end
    primes
  end
end

p Sieve.new(100).primes

# first, take the first number in the array and delete all the remaining numbers that are divisable by that number, using an iterator.
# then, move the counter to the next prime number left, and delete all remaining numbers divisable by that number using iteration.
# repeat until counter == array.size
