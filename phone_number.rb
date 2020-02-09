class PhoneNumber
  DEFAULT = '0000000000'

  def initialize(num)
    @digits = num
  end

  def number
    return DEFAULT if @digits =~ /[a-z]/i

    @digits.gsub!(/\D/, '')

    return DEFAULT unless (10..11).include?(@digits.size)

    case @digits.size
    when 10 then @digits
    when 11 then @digits = (@digits[0] == '1') ? @digits[1..-1] : DEFAULT
    else DEFAULT
    end
  end

  def to_s
    number
    @digits.gsub(/(...)(...)(....)/, '(\1) \2-\3')
  end

  def area_code
    @digits[0..2]
  end
end

