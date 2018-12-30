def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      puts 'FizzBuzz'
    elsif num % 3 == 0
      puts 'Fizz'
    elsif num % 5 == 0
      puts 'Buzz'
    else 
      puts num
    end
  end
end


fizzbuzz(1, 15)