# input: creates a buffer worth x length
# write pushes a new number to the first space
# BufferFullException occures if buffer is full and you try to write to the buffer
# read removes the oldest number
# BufferEmptyException occurs when buffer is empty and try to read 
# write! forces a new number to the oldest space

# output: 

class BufferFullException < Exception; end
class BufferEmptyException < Exception; end

class CircularBuffer
  attr_accessor :buffer

  def initialize(size_of_buffer)
    @size_of_buffer = size_of_buffer
    @buffer = Array.new(size_of_buffer)
    @oldest_idx = 0
    @newest_idx = 0
  end

  def write(value)
    raise BufferFullException if full?
    return if value == nil
    @buffer[@newest_idx] = value
    @newest_idx += 1
  end

  # def write!(value)
  #   @buffer[@oldest_idx] = value
  # end

  def read
    raise BufferEmptyException if empty?
    deleted = @buffer.delete_at(@oldest_idx)
    @buffer.insert(@oldest_idx, nil)
    rotate_oldest
    deleted
  end

  def rotate_oldest
    @oldest_idx >= @buffer.size ? @oldest_idx = 0 : @oldest_idx += 1 
  end

  def full?
    @buffer.all? { |x| x }
  end

  def empty?
    @buffer.all? { |x| x == nil }
  end

  def clear
    @buffer = Array.new(@size_of_buffer)
    @oldest_idx = 0
    @newest_idx = 0
  end
end

# buffer = CircularBuffer.new(2)
# p buffer.buffer
# buffer.write '1'
# buffer.write '2'
# # buffer.write '3'
# p buffer.buffer
# buffer.read 
# buffer.read
# # buffer.read
# p buffer.buffer
# buffer.read

