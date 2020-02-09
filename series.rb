class Series
  def initialize(digit_str)
    @digit_str = digit_str
  end

  def slices(n)

    digits = @digit_str.chars.map(&:to_i)
    raise ArgumentError if n > digits.size
    digits.each_cons(n).to_a
  end
end

s1 = Series.new('012345')

p s1.slices(2)