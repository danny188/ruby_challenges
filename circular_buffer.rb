class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @buffer = Array.new(size)
    @head = 0
    @tail = 0
  end

  def write(item, overwrite: false)
    return if item.nil?

    raise BufferFullException if buffer_full? && !overwrite

    @buffer[@head] = item

    @head = next_index(@head)
    @tail = @head if buffer_full?
  end

  def write!(item)
    write(item, overwrite: true)
  end

  def read
    raise BufferEmptyException if buffer_empty?

    read_item = @buffer[@tail]
    @buffer[@tail] = nil
    @tail = next_index(@tail)

    read_item
  end

  def clear
    initialize(@buffer.size)
  end

  private

  def next_index(current)
    current >= (@buffer.size - 1) ? 0 : current + 1
  end

  def buffer_full?
    @buffer.compact.size == @buffer.size
  end

  def buffer_empty?
    @buffer.compact.empty?
  end
end

