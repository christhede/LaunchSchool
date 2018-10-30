def palindromic_number?(input)
  puts input.to_s == input.to_s.reverse
end

palindromic_number?(34543) == true
palindromic_number?(00123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true