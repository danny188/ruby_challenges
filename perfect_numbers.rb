class PerfectNumber

  def self.classify(num)
    raise RuntimeError if num < 2

    if num > sum_of_factors(num)
      'deficient'
    elsif num < sum_of_factors(num)
      'abundant'
    else
      'perfect'
    end
  end

  def self.sum_of_factors(num)
    factors(num).sum
  end

  def self.factors(num)
    factors = []
    (1..Math.sqrt(num).to_i).each do |candidate|
      if num % candidate == 0
        factors << candidate
        factors << num / candidate if num / candidate != candidate
      end
    end
    factors.sort[0..-2]
  end

end

# p PerfectNumber.classify(6)