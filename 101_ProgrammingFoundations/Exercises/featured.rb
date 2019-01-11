def featured(count)
  num = 0

  loop do
    num += 7
    break if num > count &&
             (num % 7).zero? &&
             num.odd? &&
             num.digits.uniq!.nil?
  end
  num
end

featured(997)
featured(12) #== 21
featured(20) #== 21
featured(21) #== 35
featured(997) #== 1029
featured(1029) #== 1043
featured(999_999) #== 1_023_547
featured(999_999_987) # == 1_023_456_987
