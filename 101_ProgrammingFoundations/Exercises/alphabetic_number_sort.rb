HSH = { 0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten'
}.freeze

def alphabetic_number_sort(numbers)
  arr = []
  arr = numbers.sort_by! do |num|
    HSH[num]
    end
    puts arr
end

alphabetic_number_sort((0..10).to_a)