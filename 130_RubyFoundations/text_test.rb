# require_relative 'sample_text'
require_relative 'text'
require 'minitest/autorun'


class TextTest < Minitest::Test
	def setup
		@paragraph = File.open('sample_text.txt')
		@text = Text.new(@paragraph.read)
	end

	def test_swap
		assert_equal("Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi.", @text.swap('a', 'e') )
	end

	def test_word_count
		assert_equal(72, @text.word_count)
	end

	def teardown
		@paragraph.close
	end
end