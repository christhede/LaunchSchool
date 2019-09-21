require "minitest/autorun"
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    output = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi."
    assert_equal output, text.swap('a', 'e')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end