HEX_TO_DECIMAL = {}

(0..9).each {|num| HEX_TO_DECIMAL[num.to_s] = num}

HEX_TO_DECIMAL['A'] = 10
HEX_TO_DECIMAL['B'] = 11
HEX_TO_DECIMAL['C'] = 12
HEX_TO_DECIMAL['D'] = 13
HEX_TO_DECIMAL['E'] = 14
HEX_TO_DECIMAL['F'] = 15

BASE = 16

def hex_to_decimal(hex_str)
  return 0 if hex_str =~ /[^0-9A-F]/i

  hex_str.reverse.chars.each_with_index.map do |char, idx|
    BASE**idx * HEX_TO_DECIMAL[char]
  end.reduce(:+)
end

p hex_to_decimal('1C') # 28
p hex_to_decimal('1F') # 31