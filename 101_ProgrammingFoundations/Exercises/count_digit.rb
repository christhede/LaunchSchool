# Take an integer n (n >= 0) and a digit d (0 <= d <= 9) as an integer. Square all numbers k (0 <= k <= n) between 0 and n. Count the numbers of 
# digits d used in the writing of all the k**2. Call nb_dig (or nbDig or ...) the function taking n and d as parameters and returning this count.

# n is greater than 0
# d is a number betweeen 0 and 9
# k is 

def nb_dig(n, d)
    k = []
    counter = 0
    
    (0..n).each do |x|
        k << x**2
    end

    k.each do |x|
        counter += x.digits.count(d)
    end

    counter
end
    
    
    
p nb_dig(10, 1) 
