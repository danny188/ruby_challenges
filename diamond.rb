def diamond(n)
  top_half = Array.new((n-1)/2) {|i| ' ' * ((n-1)/2 - i) + '*' * (1 + i * 2) + "\n"}
  result = top_half.join('')

  result.concat('*' * n + "\n")

  top_half.reverse_each { |line| result.concat(line) }

  # returns string containing diamond
  result
end

# def hollow_diamond(n)
#   filled_diamond = diamond(n)
#   # filled_diamond.gsub!(/\*(?=\n)|(?<= )\*|(?<=\n)\*/, '$')
#   # filled_diamond.gsub!(/[^$\n]/, ' ')
#   # filled_diamond.gsub!('$', '*')  
# end

def hollow_diamond(n)
  diamond(n).gsub!(/([*])(.*)([*]\n)/) { $1 + (' ' * $2.length) + $3 }
end
# https://launchschool.com/exercises/75ff93ae#solution-comment-522bf493


puts hollow_diamond(9)

 

