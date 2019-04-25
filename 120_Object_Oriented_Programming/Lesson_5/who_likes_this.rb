# input: an array of string names

# break into different categories
# 1. for no names in array

# 2. For only 1 name in array
# puts "#{array[0]} likes this"

# 3. for 2 in array
# puts "array[0] & array[1] like this"

# 4. for 3 or more in array
# use map to iterate through array, putting a comma behind every name,
# until the last name where an 'and' should be placed in front of,
# and "likes this" follows 

# output: a new string including those names like so:
# "Jacob and Alex like this"

def likes(array)
  case array.size
  when 0
    "no one likes this"
  when 1
    "#{array[0]} likes this"
  when 2 
    "#{array[0]} and #{array[1]} like this"
  when 3
    "#{array[0]}, #{array[1]} and #{array[2]} like this"
  else
    "#{array[0]}, #{array[1]} and #{array.size - 2} others like this"
  end
end

likes([])
likes(["Peter"])
likes(["Peter", "Paul"])
likes(["Peter", "Paul", 'Alex'])
likes(['Alex', 'Jacob', 'Mark', 'Max'])