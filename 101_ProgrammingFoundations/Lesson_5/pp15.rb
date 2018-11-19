HEX = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']
uuid_string = []

def uuid
  uuid_string = HEX.sample(8) + ['-'] + 
                HEX.sample(4) + ['-'] + 
                HEX.sample(4) + ['-'] + 
                HEX.sample(4) + ['-'] + 
                HEX.sample(12)
  p uuid_string.join
end

uuid