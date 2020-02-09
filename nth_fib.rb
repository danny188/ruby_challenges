class Fib
  def self.n_th(n)
    seq = [0,1]

    while seq.size < n
      seq << seq[-1] + seq[-2]
    end

    seq[n - 1]
  end
end