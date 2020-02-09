class Integer
  def to_roman
    letter = [ {:ones => 'I', :fives => 'V'},
                {:ones => 'X', :fives => 'L'},
                {:ones => 'C', :fives => 'D'},
                {:ones => 'M'} ]


    digits = self.digits

    result = ''
    digits.each_with_index do |digit, power|

      new_letters = case
                    when digit <= 3
                      letter[power][:ones] * digit
                    when digit > 3 && digit <= 5
                      letter[power][:ones] * (5 - digit) + letter[power][:fives]
                    when digit > 5 && digit <= 8
                      letter[power][:fives] + letter[power][:ones] * (digit - 5)
                    when digit == 9
                      letter[power][:ones] + letter[power+1][:ones]
                    end

      result.prepend(new_letters)
    end
    result
  end
end


=begin

array of hash

integer to roman
from left, get digit and power of 10
  power = 3 letter means M
  power = 2 letter means C
  power = 1 letter means X
  power = 0 letter means I
if digit <= 3, add to roman: digit * letter[1] of current position
if digit > 3 and <= 5, add (5 minus digit) current position letter, then (append position-1)'s '5' letter
if digit > 5 and <= 8, add current position's '5' letter, then append (digit - 5) * current position's '1' letter
if digit == 9, letter[1] of current position, + letter[1] of next position
=end