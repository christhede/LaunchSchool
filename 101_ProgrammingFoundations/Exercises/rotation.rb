# Input:

# a string strng
# an array of strings arr
# Output of function contain_all_rots(strng, arr) (or containAllRots or contain-all-rots):

# a boolean true if all rotations of strng are included in arr (C returns 1)
# false otherwise (C returns 0)
# Examples:
# contain_all_rots(
#   "bsjq", ["bsjq", "qbsj", "sjqb", "twZNsslC", "jqbs"]) -> true

# contain_all_rots(
#   "Ajylvpy", ["Ajylvpy", "ylvpyAj", "jylvpyA", "lvpyAjy", "pyAjylv", "vpyAjyl", "ipywee"]) -> false)

# first, find all of the rotated options of the string
# create a new array which will hold all of the rotated strings
# iterate through string, rotating the first letter to the end, and adding that string to the array
# break out of loop when all letters have been rotated

# second, compare that array of rotated strings to the array of strings

require 'pry'

def rotation(string)
  new_arr = []
  string = string.chars

  1.upto(string.size) do
    string << string.shift
    new_arr << string.join
  end

  new_arr
end

def contain_all_rots(strng, array)
  strng.empty? ? true : rotation(strng).all? { |word| array.include?(word) }
end

p contain_all_rots("", [])
p contain_all_rots("", ["bsjq", "qbsj"])
p contain_all_rots("bsjq", ["bsjq", "qbsj", "sjqb", "twZNsslC", "jqbs"])
p contain_all_rots("Ajylvpy", ["Ajylvpy", "ylvpyAj", "jylvpyA", "lvpyAjy", "pyAjylv", "vpyAjyl", "ipywee"])
p contain_all_rots("XjYABhR", ["TzYxlgfnhf", "yqVAuoLjMLy", "BhRXjYA", "YABhRXj", "hRXjYAB", "jYABhRX", "XjYABhR", "ABhRXjY"])
