# using the index of the buffer, if iterated over the buffer, use a counter to keep track of where the buffer is. 
class BufferEmptyException < StandardError; end
class BufferFullException < StandardError; end

class CircularBuffer
  attr_reader :buffer, :current_index, :oldest_index

  def initialize(size_of_buffer)
    @buffer = Array.new(size_of_buffer, nil)
    @size_of_buffer = size_of_buffer
    @current_index = 0
    @oldest_index = 0
  end

  def write(char)
    raise BufferFullException, "Buffer Full" if @buffer.all? {|x| ('1'..'9').include? x }
    if @current_index == @oldest_index
      @oldest_index == @buffer.size-1 ? @oldest_index = 0 : @oldest_index += 1
    end
    @buffer[@current_index] = char
    @current_index == @buffer.size-1 ? @current_index = 0 : @current_index += 1
  end

  def read
    raise BufferEmptyException if @buffer[@oldest_index] == nil
    num = @buffer[@oldest_index]
    @buffer[@oldest_index] = nil
    @oldest_index == @buffer.size-1 ? @oldest_index = 0 : @oldest_index += 1
    num
  end

  def clear
    @buffer = Array.new(@size_of_buffer, nil)
  end
end

buffy = CircularBuffer.new(3)
('1'..'3').each { |x| buffy.write x }
p buffy.current_index
p buffy.oldest_index
buffy.clear
p buffy.buffer
# buffy.read
buffy.write '1'
buffy.write '2'
p buffy.buffer
p buffy.current_index
p buffy.oldest_index
p buffy.read

