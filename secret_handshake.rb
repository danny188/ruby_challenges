

=begin
  input: binary str or decimal integer
  output: array of string commands

  algo:
  if input string, convert to decimal


  for each handshake code
    if number >= code && num != 16 
      add corresponding handshake to commands
      subtract code from num
    elsif num == 16
      reverse commands
    end

  return commands
=end

class SecretHandshake

  CODES = { 1 => 'wink',
            2 => 'double blink', 
            4 => 'close your eyes',
            8 => 'jump',
            16 => :reverse }

  def initialize(input)
    if input.is_a?(String)
      @num = input.to_i(2)
    elsif input.is_a?(Integer)
      @num = input
    end
  end

  def commands()
    commands = CODES.fetch(@num, [])

    return [commands] unless commands.empty?

    CODES.each do |code, cmd|
      if @num >= code && @num != CODES.key(:reverse)
        commands << cmd
        @num -= code
      elsif @num == CODES.key(:reverse)
        commands.reverse!
      end
    end
    commands
  end
end
