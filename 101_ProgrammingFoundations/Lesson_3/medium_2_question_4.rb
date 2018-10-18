def rolling_buffer1(buffer, max_buffer_size, new_element)
  # buffer assignment gets new-element pushed to it
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

p rolling_buffer1([4, 5, 6, 7, 8, 8, 10, 11, 12, 13], 8, 2)
p rolling_buffer2([4, 5, 6, 7, 8, 8, 10, 11, 12, 13], 8, 2)