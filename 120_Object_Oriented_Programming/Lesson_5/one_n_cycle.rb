def cycle(num)
  if coprime?(divisible_array(10), divisible_array(n))
    repeating_pattern(1000**100 / num)
  else
    -1
  end
end

def divisible_array(num)
  arr = []
  (2..num - 1).each do |x|
    arr << x if num % x == 0
  end

  arr
end

def coprime?(array1, array2)
  !array1.any? { |x| array2.include? x }
end

def repeating_pattern(num)
  arr = convert_decnum_to_whole_num(num)

  counter = 1
  counter_two = 0
  new_arr = []

  loop do
    until arr[0] == arr[counter]
      counter += 1
    end

    new_arr = []
    counter_two = counter

    counter.times do |x|
      if arr[x] == arr[counter_two]
        new_arr << arr[x]
        counter_two += 1
      else
        break
      end
    end

    break if new_arr.size == counter

    counter += 1
  end

  new_arr.size
end

def convert_decnum_to_whole_num(num)
  zeros = num.to_s.chars.size - 2
  number = '1' + '0' * zeros
  num *= number.to_i
  num = num.to_i.digits.reverse
end

p cycle(33) # 2
p cycle(18118) # -1
p cycle(69) # 22
p cycle(197) # 98
p cycle(65) # -1
# return number of numbers repeating