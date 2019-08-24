# first, create an array to hold the tree, and input the first number in. 
# input 4 into array. 
# If inputing a 1, input it to the left of 4 because it is less than 4. 

# [1, 2, 3, '4', 5, 6, 7]


class Bst
  def initialize
    @tree = [1, 2, 3, 4, 5, 6, 7]
    @center = @tree.size/2 - 1
  end

  def insert
    # if input is less than or greater than center, move it to the left or the right of center in @tree
    # if input is less than center, check if it is less than center index - 1
  end

  def data
    @tree[@center]
  end

  private

  def left
    @center - 1
  end

  def right
    @center + 1
  end
end


tree = Bst.new
p tree.data
p tree.left
# p tree.left.left.data