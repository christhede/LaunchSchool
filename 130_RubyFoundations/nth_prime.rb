class Prime
  def self.nth(nth)
    raise ArgumentError if nth == 0

    arr = []
    num = 2
    until arr.count == nth
      arr << num if prime? num
      num += 1
    end
    arr.last
  end

  def self.prime?(num)
    sqrt = Math.sqrt(num).floor
    arr = 1.upto(sqrt).select { |x| num % x == 0 }
    arr.count == 1
  end
end
