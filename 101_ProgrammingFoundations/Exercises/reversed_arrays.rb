list = [1,2,3,4]
new_list = []
index = -1
    loop do 
        break if index == -5
        new_list << list[index]
        index -= 1
    end
p new_list
p list