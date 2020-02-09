class Scrabble
  SCORES = [1, 3, 3, 2, 1, 4, 2, 4, 1, 8,
            5, 1, 3, 1, 1, 3, 10, 1, 1, 1,
            1, 4, 4, 8, 4, 10]

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = word.strip if word
  end

  def score
    return 0 unless @word

    @word.downcase!
    return 0 if @word.empty?

    score = 0
    @word.chars.each do |c|
      pos = c.ord - 97
      score += SCORES[pos]
    end

    score
  end
end

