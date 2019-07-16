# - translate RNA sequences in to proteins
# - RNA can be broken into 3 sequences, called codons
# - then translated to a polpeptide

# First, we have to design of_codon.
# of codon, takes our acronym, a three letter uppercase word, and returns the protein name.
# create a table or hash to store these values and iterate through them to find the right protein and returns

class InvalidCodonError < StandardError; end

PROTEIN = { AUG: 'Methionine',
            UUU: 'Phenylalanine',
            UUC: 'Phenylalanine',
            UUA: 'Leucine', 
            UUG: 'Leucine',
            UCU: 'Serine',
            UCC: 'Serine',
            UCA: 'Serine',
            UCG: 'Serine',
            UAU: 'Tyrosine',
            UAC: 'Tyrosine',
            UGU: 'Cysteine',
            UGC: 'Cysteine',
            UGG: 'Tryptophan',
            UAA: 'STOP',
            UAG: 'STOP',
            UGA: 'STOP' }

class Translation
  def self.of_codon(codon)
    PROTEIN[codon.to_sym]
  end

  def self.of_rna(string)
    codons = []
    codons << string.slice!(0..2) until string.empty?

    raise InvalidCodonError, "Invalid codon" unless codons.any? { |codon| valid_codon?(codon) }

    codons.each_with_object([]) do |codon, new_arr| 
      if of_codon(codon) == 'STOP'
        return new_arr
      else
        new_arr << of_codon(codon)
      end
    end
  end

  def self.valid_codon?(codon)
    PROTEIN.has_key?(codon.to_sym)
  end
end

p Translation.of_rna('AUGUUUUAG')
# p Translation.of_rna('Carrot')





