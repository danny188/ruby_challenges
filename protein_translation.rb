class InvalidCodonError < StandardError
end

class Translation
  CODONS_LOOKUP = { %w(AUG) => 'Methionine',
             %w(UUU UUC) => 'Phenylalanine',
             %w(UUA UUG) => 'Leucine',
             %w(UCU UCC UCA UCG) => 'Serine',
             %w(UAU UAC) => 'Tyrosine',
             %w(UGU UGC) => 'Cysteine',
             %w(UGG) => 'Tryptophan',
             %w(UAA UAG UGA) => 'STOP' }


  def self.flatten_CODONS_hash
    @codon_to_protein = {}
    CODONS_LOOKUP.each do |codons, protein|
      codons.each {|codon| @codon_to_protein[codon] = protein}
    end
  end

  def self.of_codon(codon)
    flatten_CODONS_hash
    @codon_to_protein.fetch(codon) { raise InvalidCodonError, "Invalid Codon supplied"}
  end

  def self.of_rna(strand)
    flatten_CODONS_hash unless @codon_to_protein

    result = []
    codons = strand.scan(/.../).each do |codon|
      protein = of_codon(codon)
      break if protein == 'STOP'
      result << protein
    end
    result
  end
end

