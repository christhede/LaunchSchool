#          # rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,   # <--- nexus
#           23  =>  11,
#           30  =>   2 }

def nexus(hsh)
  hsh.map do |rank, honor|
    hsh[rank] = (rank - honor).abs
  end

  puts value = hsh.values.sort.first
  p hsh.keys.sort

  if hsh.values.

   puts hsh.key(value)
end


# input 
#   a hash of rank => honor values

# iterate through the hash using select, 
# if a rank is equal to it's honor, return that group
# elsif find the rank that is the closest in value to the honor
# 

# output 
#   retunr a hash of the nexus, the r
# ank that is closest to his honor


users = {1 => 3, 3 => 3, 5 => 1}
users2 = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
users3 = { 3 => 4, 1 => 2, 2 => 3}

# puts nexus(users)
# puts nexus(users2)
nexus(users3)