
class Triangle
  def initialize(input)
    @num_of_rows = input
    @rows = []
  end

  def rows
    old_row = [1]

    (1..@num_of_rows).each do |x|
      new_row = (0..old_row.size).to_a

      (0..old_row.size).each do |i|
        if i == 0
          new_row[0] = 1
        elsif i == old_row.size
          new_row[-1] = 1
        else
          new_row[i] = old_row[i-1] + old_row[i]
        end
      end

      @rows << old_row
      old_row = new_row
    end
    @rows
  end

  def last
    rows.last
  end
end

