class Octal
  BASE = 8

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal =~ /[^0-7]/

    digits = @octal.chars.map(&:to_i).reverse
    digits.each_with_index.reduce(0) do |memo, (digit, idx)|
      memo += (BASE**idx) * digit
    end
  end
end

# class Octal
#   attr_accessor :oct_ary

#   def initialize(octal_str)
#     oct = octal_str.to_i.abs
#     self.oct_ary = split_to_ary(oct)
#   end

#   def split_to_ary(x)
#     p Math.log10(x).floor.downto(0).map { |i| (x / 10**i) % 10 }
#   end

#   def to_decimal
#     oct_ary.reverse.each_with_index.map do |x, i|
#       8**i * x
#     end.reduce(:+)

#   end
# end

# o = Octal.new('233')

# p o.to_decimal

=begin
get digits startin from rightmost
add to sum : 8**index * digit
=end