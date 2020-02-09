require 'prime'
require 'pry-byebug'

def factors_of(number)
  primes, powers = number.prime_division.transpose
   p number.prime_division
   puts "primes #{primes}"
   puts  "powers #{powers}"
   exponents = powers.map{|i| (0..i).to_a}

  divisors = exponents.shift.product(*exponents).map do |powers|
    binding.pry
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

# p factors_of(90)