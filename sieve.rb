# class Sieve
#   def initialize(limit)
#     @limit = limit
#   end

#   def primes
#     marks = Array.new(@limit) { false } # 0 means unmarked
#     marks[0], marks[1] = true, true

#     last_unmarked_index = 1
#     loop do 
#       last_unmarked_index = find_next_unmarked_index(marks, last_unmarked_index)
#       break if !last_unmarked_index
#       mark_multiples_of(marks, last_unmarked_index)    
#     end

#     find_unmarked_indices(marks)
#   end

#   def find_unmarked_indices(marks)
#     result = []

#     marks.each_with_index do |marked, idx|
#       result << idx if !marked
#     end

#     result
#   end

#   def find_next_unmarked_index(marks, last_unmarked_index)
#     marks.each_with_index do |marked, index|
#       return index if index > last_unmarked_index && !marked
#     end
#     nil
#   end

#   def mark_multiples_of(marks, multiple)
#     marks.each_with_index do |marked, index|
#       #puts "#{index} multiple #{multiple} result #{index % multiple}"
#       marks[index] = true if index % multiple == 0 && index > multiple
#     end
#   end
# end

# sieve_obj = Sieve.new(10)
# # p sieve_obj.primes

class Sieve
  FIRST_PRIME = 2

  def initialize(limit)
    @numbers = Hash[Array.new(limit + 1) { |idx| [idx, false] }]
    @numbers[0], @numbers[1] = true, true
  end

  def primes
    current_num = FIRST_PRIME - 1
    loop do
      current_num = next_unmarked(current_num)
      break if !current_num

      mark_multiples_of(current_num)
    end

    @numbers.select { |_, marked| !marked }.keys
  end

  def next_unmarked(last_num)
    @numbers.each do |number, marked|
      return number if number > last_num && !marked
    end
    nil
  end

  def mark_multiples_of(unmarked_number)
    @numbers.each do |number, _|
      @numbers[number] = true if (number > unmarked_number) && (number % unmarked_number == 0)
    end
  end
end