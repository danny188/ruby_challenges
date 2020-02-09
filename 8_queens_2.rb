
def queens_in_line?(x1, y1, x2, y2)
  (x1 - x2).abs == (y1 - y2).abs
end

def queens_puzzle
  queen_positions = (0..6).to_a

  solutions = 0

  all_possible = queen_positions.permutation

  all_possible.each do |positions|

    solutions += 1 if (positions.combination(2).none? do |pair|
      x1 = positions.index(pair[0])
      y1 = pair[0]
      x2 = positions.index(pair[1])
      y2 = pair[1]
      queens_in_line?(x1, y1, x2, y2)
    end)
  end

  p solutions
end

queens_puzzle()