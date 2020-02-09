class SumOfMultiples
  DEFAULT_FACTORS = [3,5]

  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    self.new.to(limit)
  end

  def to(limit)
    # p ((@factors.min...(limit)).to_a.select do | number|
    #   @factors.any? {|factor| number % factor == 0 }
    # end).to_a

    @factors = DEFAULT_FACTORS if @factors.empty?

    multiples = (@factors.min...(limit)).to_a.select do |number|
      @factors.any? {|factor| number % factor == 0 }
    end
    
    multiples.sum
  end
end

# s = SumOfMultiples.new(3,5)

p SumOfMultiples.to(20)