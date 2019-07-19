# if strand.chars.[index] == distance.chars.[index], then @count += 1
# index += 1

# shortest string
# if @strand.size < distance.size ? nil : 

# require 'pry'

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand.chars
    @count = 0
  end

  def hamming_distance(distance)
    @strand.each_with_index do |obj, idx|
      break if idx == distance.chars.size
      unless obj == distance.chars[idx]
        @count += 1
      end
    end
    p @count
  end
end

# DNA.new('AGACAACAGCCAGCCGCCGGATT').hamming_distance('AGGCAA')
# DNA.new('AGACAACAGCCAGCCGCCGGATT').hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
# DNA.new('AGACAACAGCCAGCCGCCGGATT').hamming_distance('AGG')
# AGACATCTTTCAGCCGCCGGATTAGGCAA
# AGACAACAGCCAGCCGCCGGATT