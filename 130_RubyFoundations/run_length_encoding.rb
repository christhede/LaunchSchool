# first we need to split the code into seperated chunks with the split array, using a a rrexep to separate the different repeated numbers. output an array
# then itarate through that array with map, calling .count on every iteration, and inplementing the count and character before output.
# Then join array together in a string to complete encode.

class RunLengthEncoding
  def self.encode(input)
    new.encode(input)
  end

  def encode(input)
    @input = input.chars
    @char_count = 0
    @current_char = input[0]
    @final_arr = []

    run_encode
  end

  def run_encode
    @input.each_with_index do |x, idx|
      if x != @current_char && idx == @input.size - 1
        push_and_update_values(x)
        push_to_array
      elsif x != @current_char
        push_and_update_values(x)
      elsif idx == @input.size - 1
        @char_count += 1
        push_to_array
      else
        @char_count += 1
      end
    end
    @final_arr.flatten.join
  end

  def push_and_update_values(x)
    push_to_array
    @current_char = x
    @char_count = 1
  end

  def push_to_array
    if @char_count > 1
      @final_arr << [@char_count, @current_char]
    else
      @final_arr << [@current_char]
    end
  end

  def self.decode(input)
    @input = input.scan(/[\d]*[\D]/i)
    @input.map do |code|
      if code.size > 2
        code[2] * (code[0]+code[1]).to_i
      elsif code.size == 2
        code[1] * code[0].to_i
      else
        code
      end
    end.join
  end
end

