'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    'AGGACGGATTCTGACCTGGACTAATTTTGGGG'

=begin
equalize length of strands
for each index
  add to humming if chars different and
=end

# class DNA
#   def initialize(strand1)
#     @strand1 = strand1
#   end

#   def hamming_distance(strand2)
#     shorter_strand_size = [@strand1.size, strand2.size].min
#     hamming_distance = 0
#     (0...shorter_strand_size).each do |index|
#       hamming_distance += 1 if @strand1[index] != strand2[index]
#     end
#     hamming_distance
#   end
# end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_2)
    strand_1 = @strand[0, strand_2.length]
    p strand_1

    strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
  end
end

# d = DNA.new('AB')
# p d.hamming_distance('ABC')