def real_palindrome?(input)
  new_string = input.delete("'").delete(" ").delete(",").downcase
  new_string == new_string.reverse
  puts new_string
  puts new_string.reverse
end

# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
p real_palindrome?("123a321")