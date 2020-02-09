class Sieve
  def initialize(limit)
    @numbers = Hash[Array.new(limit + 1) { |idx| [idx, false] }]
    @numbers[0], @numbers[1] = true, true
  end

  def primes
    current_num = 1
    loop do
      current_num = next_unmarked(current_num)
      break if !current_num

      mark_multiples_of(current_num)
    end

    @numbers.select { |_, marked| !marked }.keys
  end

  def next_unmarked(last_num)
    @numbers.each do |number, marked|
      return number if number > last_num && !marked
    end
    nil
  end

  def mark_multiples_of(unmarked_number)
    @numbers.each do |number, _|
      @numbers[number] = true if (number > unmarked_number) && (number % unmarked_number == 0)
    end
  end
end



s1 = Sieve.new(10)
p s1.primes