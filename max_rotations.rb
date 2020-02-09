


def rotate_rightmost_digits(num_str, start_index)
  raise ArgumentError, 'start_index invalid' unless (0...num_str.size).include?(start_index)

  left_most = num_str.chars
  right_most = left_most.slice!(start_index...num_str.size)

  #right_most.rotate!
  right_most.push(right_most.shift)

  (left_most + right_most).join
end

def max_rotation(num)
  result = num.to_s
  index = 0

  loop do
    break if index >= result.size - 1
    result = rotate_rightmost_digits(result, index)

    if result[0] == '0'
      result = result.slice(1..-1)
    else
      index += 1
    end

  end
  result.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(105) == 15
# p max_rotation(8703529146) == 7321609845

