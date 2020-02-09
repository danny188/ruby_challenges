=begin
for each square in current board, try mark Q
  if no available square,
    return
  elsif num_queens == 8,
    save configuration
  else
    create board copy to add unavailable squares
    for each remaining available squares
      recurse with argument(board_copy, num_queens + 1)
  end

  @configuations.uniq.size

  #94 is answer
=end



require 'pry-byebug'

class EightQueens
  def initialize(dimension, required_num_of_queens)
    @dimension = dimension
    @configurations = []
    @board = Array.new(@dimension**2) { 'A' } # 'A' for available, 'Q' = queen, 'X' = not valid
    @required_num_of_queens = required_num_of_queens
    @runs = 0

  end

  def solve
    # p diagonal_indices(0)
    # return

    generate_configurations(@board, 0)

    #@configurations.each {|c| print_board(c)}


    config_num = @configurations.uniq.size
    puts "num of configurations found = #{config_num}"
  end

  def generate_configurations(board, num_of_queens)
    @runs += 1
    puts "num_of_queens = #{num_of_queens}, run #{@runs}"
    print_board(board)
    binding.pry
    if num_of_queens >= @required_num_of_queens
      @configurations << board
    elsif board.none? { |item| item == 'A' }
      return
    else
      board.each_with_index do |slot, idx|
        if slot == 'A'
          updated_board = add_queen(board, idx)

          generate_configurations(updated_board, num_of_queens + 1)
        end
      end
    end
  end

  def add_queen(board, new_queen_index)
    board_copy = board.clone

    horizontal_indices = left_edge_index(new_queen_index)..right_edge_index(new_queen_index)

    board_copy.each_index do |idx|
      index_difference = (new_queen_index - idx).abs
      if index_difference % @dimension == 0 || # mark vertical
        horizontal_indices.include?(idx) ||  # mark horizontal
        diagonal_indices(new_queen_index).include?(idx) # mark diagonals

        board_copy[idx] = 'X' # mark as unavailable
      end
    end

    board_copy[new_queen_index] = 'Q'
    board_copy
  end

  def diagonal_indices(queen_index)
    indices = []
    indices_board = []
    (0..63).to_a.each_slice(@dimension) {|slice| indices_board << slice}
    row = queen_index / @dimension
    col = indices_board[row].index(queen_index)
    #puts "row #{row} col #{col}"
    indices_board.each_with_index do |cur_row, row_idx|
      cur_row.each_with_index do |cur_item, col_idx|
        indices << cur_item if (row - row_idx).abs == (col - col_idx).abs
      end
    end
    indices
  end

  def left_edge_index(queen_index)
    raise ArgumentError unless (0..(@dimension**2-1)).include?(queen_index)

    queen_index.downto(0).each do |idx|
      return idx if idx % @dimension == 0
    end
  end

  def right_edge_index(queen_index)
    left_edge_index(queen_index) + @dimension - 1
  end

  def print_board(board)
    board.each_slice(@dimension) {|slice| puts slice.join(",")}
    puts
  end
end

# puzzle = EightQueens.new(6, 6)

# puzzle.solve