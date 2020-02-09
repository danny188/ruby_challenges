=begin
  case insensitive
  no regex

=end

def valid_char?(char)
  ('a'..'z').cover?(char.downcase)
end

def palindrome?(word)
  chars = word.chars

  left_to_right, right_to_left = '', ''
  chars.each do |char|
    left_to_right += valid_char?(char) ? char : ''
  end

  chars.reverse_each do |char|
    right_to_left += valid_char?(char) ? char : ''
  end

  left_to_right.downcase == right_to_left.downcase
end

p palindrome?('noon') # true
p palindrome?('noOn') # true
p palindrome?('no1,3o2n') # true
p palindrome?('n') #true
p palindrome?('') #true
p palindrome?('none') #false
