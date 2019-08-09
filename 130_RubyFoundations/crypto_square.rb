class Crypto
  def initialize(text)
    @text = text
    @size = nil
  end

  def normalize_plaintext
    @text = @text.scan(/\w/).join.downcase
  end

  def size
    normalize_plaintext
    Math.sqrt(@text.size).ceil
  end

  def plaintext_segments
    normalize_plaintext
    @text.scan(/.{1,#{size}}/)
  end

  def ciphertext
    encode.join
  end

  def normalize_ciphertext
    encode.map(&:join).join(' ')
  end

  def encode
    cipher_text = []
    arr_of_segments = plaintext_segments.map {|word| word.chars }
    until arr_of_segments.flatten.empty?
      cipher_text << arr_of_segments.map {|x| x.delete_at(0) }
    end
    cipher_text
  end
end

# crypto = Crypto.new('Vampires are people too!')
# # p crypto.plaintext_segments
# p crypto.ciphertext
# p crypto.normalize_ciphertext


