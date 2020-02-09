=begin

=end

class Prime


  def self.nth(n)
  raise ArgumentError unless n > 0

    limit = n*(Math.log(n) + Math.log(Math.log(n)))

    limit = 30 if limit < 30

    sieve = Array.new(limit + 1) { |_| :prime }
    sieve[1] = :composite
    sieve[0] = :composite

    (2..Math.sqrt(limit)).each do |num|
      if sieve[num] == :prime
        ((num**2)..limit).step(num) do |j|
          sieve[j] = :composite
        end
      end
    end

    count = 0
    sieve.each_with_index do |type, num|
      if type == :prime
        count += 1
        return num if count == n
      end
    end
  end
end

def time_this
  before = Time.now

  yield

  after = Time.now

  puts "block took #{after - before} seconds to run."
end

# time_this {p Prime.nth(1000000)}