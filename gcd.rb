def gcd(a,b)
  smaller = [a,b].min
  bigger = [a,b].max


  return smaller if bigger % smaller == 0

  smaller.downto(1).each do |candidate_divisor|
    return candidate_divisor if a % candidate_divisor == 0 && b % candidate_divisor == 0
  end
end

# p gcd(1433333 ,28222222)