class Luhn
  def initialize(num)
    @digits = num.digits
  end

  def addends
    transformed_digits = @digits.each_with_index.map do |digit, idx|
      if idx.odd?
        (digit * 2) > 9 ? (digit * 2) - 9 : (digit * 2)
      else
        digit
      end
    end
    transformed_digits.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    # new(num*10).valid?
    test_luhn = Luhn.new((num.to_s + '0').to_i)

    remainder = test_luhn.checksum % 10
    check_digit = (remainder == 0) ? remainder : (10 - remainder)
    new_digits = num.to_s + check_digit.to_s
    new_digits.to_i
  end

end

# l = Luhn.new(837_263_756)
# p Luhn.create(837_263_756)