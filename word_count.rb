class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count

    real_word_boundary_regexp_str = '((?<=^|[^a-z0-9])(?=[a-z0-9])|(?<=[a-z0-9])(?=$|[^a-z0-9]))'
    extract_words = Regexp.new(real_word_boundary_regexp_str + "([\\w']+)" + real_word_boundary_regexp_str, Regexp::IGNORECASE)
    # p extract_words
    p @phrase.split(/(?<!\w)'|[\s,.?"!][\s,.?"'!]*/)
    counts = Hash.new(0)
    # p extract_words
    words = @phrase.scan(extract_words) do |group|
      word = group[1]
      counts[word.downcase] += 1
    end

    counts
  end

end

phrase1 = Phrase.new("I'd love a to 'keep' Louis' sweater.")

p phrase1.word_count


