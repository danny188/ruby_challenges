class Anagram
  def initialize(subject)
    @subject = subject
  end

  def match(words)
    result = []
      words.each do |word|
        next if @subject == word.downcase

        result << word if same_letter_counts?(word, @subject)
      end
    result
  end

  def same_letter_counts?(word1, word2)
    longer_word = word1.size > word2.size ? word1 : word2

    longer_word.chars.uniq.all? do |char|
      word1.downcase.count(char) == word2.downcase.count(char)
    end
  end
end

# a = Anagram.new('ant')

# p a.match(%w(tan stand at))

# alternative: compare sorted character arrays of two words
# permutation.any?
