# Take 2 strings s1 and s2 including only letters from ato z. Return a new sorted string, the longest possible, containing distinct letters,

# each taken only once - coming from s1 or s2. #Examples: ``` a = "xyaabbbccccdefww" b = "xxxxyyyyabklmopq" longest(a, b) -> "abcdefklmopqwxy"
# a = "abcdefghijklmnopqrstuvwxyz" longest(a, a) -> "abcdefghijklmnopqrstuvwxyz" ```

input: two strings 
# combine the two arrays with <<
# use chars to create array of letters
# use the uniq method on the new_str
# use sort on the new_str
# return new_str
output: sorted string, the longest possible containg distint letters.

def longest(s1, s2)
    new_str = s1 << s2
end



p longest("aretheyhere", "yestheyarehere") #"aehrsty"