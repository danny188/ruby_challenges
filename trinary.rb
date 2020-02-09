class Trinary
  BASE = 3

  def initialize(trinary)
    @trinary_str = trinary
  end

  def to_decimal
    result = 0
    @trinary_str.chars.each_with_index.map do |char, idx|
      p (BASE**(@trinary_str.size - idx - 1)) * char.to_i
    end.reduce(:+)
    
  end
end

t = Trinary.new('112')
p t.to_decimal