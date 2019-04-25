def createPhoneNumber(num_array)
  "(#{num_array[0..2].join}) #{num_array[3..5].join}-#{num_array[6..9].join}"
end



puts createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])