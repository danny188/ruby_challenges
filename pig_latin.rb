class PigLatin
  VOWELS = 'aeiou'
  SUFFIX = 'ay'
  HALF_VOWELS = 'xy'

  def self.translate_word(word)
    if matches = word.match(/\A([#{HALF_VOWELS}])([^#{VOWELS}]+)([a-z]*)/)
      # half vowel followed by non-vowel
      matches[0] + SUFFIX
    elsif matches = word.match(/\A([^#{VOWELS}]*qu|[^#{VOWELS}]+)([#{VOWELS}]+.*)/i)
      # begins with consonant(s)
      matches[2] + matches[1] + SUFFIX 
    elsif matches = word.match(/\A([#{VOWELS}]+)([a-z]*)/i)
      # begins with vowel
      matches[0] + SUFFIX
    end
  end

  def self.translate(phrase)
    phrase.split.map {|word| translate_word(word)}.join(" ")
  end
end

# p PigLatin.translate('chair')
# p PigLatin.translate('school')
# # p PigLatin.translate('koala')
# p PigLatin.translate('square')

# p PigLatin.translate('queen')
# # p PigLatin.translate('xray')