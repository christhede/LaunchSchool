# compute distance over shortest length
# first, check what length is shorter, then use that to calculate length
# one by one, up to certain length, check to see if strand and strand2 equal the same letter. if not, += 1 to count


class DNA
  attr_accessor :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    count = 0
    length = 0
    strand2.size > @strand.size ? length = @strand.size : length = strand2.size
    0.upto(length-1) do |idx|
      count += 1 if strand[idx] != strand2[idx]
    end

    count
  end
end

# dna = DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG').hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')

