=begin
d .
words <= 20 chars
input text: 1 or more words, separated by 1 or more spaces
            terminated by 0 or more spaces, followed by '.'
output:
single spaced words
last words terminated by '.'
odd words reversed

"whats  the matter  ." => "whats eht matter."

whats

chars read/printed one at a time

algo:

odd = false

read char
if letter
  if space == true
    space = false
    append space to result
    add prev word to result (revesre if odd word before pasting)
    odd = !odd
    start new word
  else
    add to current word
if space
  space = true
if .
  add prev word to result (revesre if odd word before pasting)
  add to result
  terminate

=end

def odd_words(text)
  odd = false

  result = ''
  word = ''
  space = false
  text.chars.each do |char|
    if char == ' '
      space = true
    elsif char == '.'
      word.reverse! if odd
      result += ' ' unless result.empty?
      result += word + char
      break
    else # letter
      if space
        space = false
        result += ' ' unless result.empty?
        word.reverse! if odd
        odd = !odd
        result += word
        word = char
      else
        word += char
      end
    end
  end

  result
end

# p odd_words('whats the matter with kansas.') #== 'whats eht matter htiw kansas.'
# p odd_words('whats  the matter   .') #== 'whats eht matter.'
# p odd_words('today is such a rainy day.  ')
# p odd_words('.')
# p odd_words('hello.   ')
# p odd_words(' hello.')
# p odd_words('')
