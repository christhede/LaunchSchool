# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 
# and so on until the top which will have a volume of 1^3.

# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?

# The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m 
# if such a n exists or -1 if there is no such n.

# create a basic loop do structure
# first, start out by adding together 1^3
# create a counter to hold number of n cubes, incremented by 1
# create a value variable to hold the value of n
# 

# iterate through checking to see if value is == to m
# n += 1, each iteration
# break if value == m
# return n

def find_nb(total_volume)
    value_of_n = 0
    n = 0

    loop do
        n += 1
        value_of_n += n**3
        break if value_of_n >= total_volume
    end

    value_of_n == total_volume ? n : -1
end

p find_nb(4183059834009) # 2022
p find_nb(24723578342962)
p find_nb(135440716410000)
p find_nb(40539911473216)