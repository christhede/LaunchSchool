class CircularQueue
  STAR = '*&*'
  
  def initialize(queue_size)
    @array = Array.new(queue_size, nil)
    @current_index = 0
    @queue_size = queue_size
    @oldest_index = 0
    @current_round = 1
  end
  
  def enqueue
    puts "ENQUEUE"
    puts "current index: #{@current_index}"
    puts "oldest index: #{@oldest_index}"

    @array[@current_index] = STAR
    @current_index += 1
    reset_index if @current_index == @queue_size
    array_empty_check

    p @array
    puts '–––––––'
  end

  def reset_index
    @current_index = 0
  end
  
  def dequeue
    puts "DEQUEUE"
    puts "current index: #{@current_index}"
    puts "oldest index: #{@oldest_index}"

    @array[@oldest_index] = nil
    @oldest_index += 1
    reset_oldest_index if @oldest_index == @queue_size
    array_empty_check

    p @array
    puts '–––––––'
  end

  def reset_oldest_index
    @oldest_index = 0
  end

  def array_empty_check
    if @array.all? {|x| x == nil}
      @current_index = 0
      @oldest_index = 0
    end
  end
  
  def to_s
    @array.to_s
  end
end

circle = CircularQueue.new(5)
circle.enqueue
circle.enqueue
circle.enqueue
circle.enqueue
circle.enqueue

circle.dequeue
circle.dequeue
circle.dequeue

circle.enqueue
circle.enqueue

circle.dequeue
circle.dequeue
circle.dequeue
circle.enqueue
circle.dequeue
circle.dequeue
circle.enqueue
puts circle


# if array[0].empty? || array[0].empty? && array[1].empty?
# delete box 2
# if array[1].empty? || array[1].empty? && array[2].empty?
#delete box 0
# if array[2].empty? || array[2].empty? && array[0].empty?
# delete box 1

# looping structure
# oldest_index = 0
# if array[num].empty?


#enque
#if array.empty? 
# array[current_index] = '*'
# current_array += 1
# elsif array[current_index].empty?
# array[current_index] = '*'
# current_array += 1
  # if current_array == 0
  # current_array = -queue_size



#dequeue
# if array.full? 
# oldest_index += 1


