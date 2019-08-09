# input: a strand of DNA

# first find the shortest length and compute from that
# iterating through the first strand, using its index to check if it is the same as strand2 index,
# if it isnt the same, plus 1 to the hamming distance

# 0.upto(distance) do |x|
#   hamming_distance += 1 if strand[x] != strand2[x]
# end

# output: a number referencing the hamming distance between the two strands


class DNA
  def initialize(strand)
    @strand = strand
  end

  def shortest_length(distance)
    @strand.size <= distance.size ? @strand.size : distance.size
  end

  def hamming_distance(distance)
    ham = 0
    0.upto(shortest_length(distance)-1) do |idx|
      ham += 1 if @strand.chars[idx] != distance.chars[idx]
    end
    ham
  end
end


# strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
# distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
# p DNA.new(strand).hamming_distance(distance)
# # p DNA.new(strand).shortest_length(distance)