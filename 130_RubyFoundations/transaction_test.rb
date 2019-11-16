
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'


class TransactionTest < Minitest::Test
	def setup
		@register = CashRegister.new(500)
		@transaction = Transaction.new(500)
	end

	 def test_prompt_for_payment
  	input = StringIO.new('500\n')
  	assert_output ("You owe $500.\nHow much are you paying?\n") do 
  		@transaction.prompt_for_payment(input: input)
  	end
  	# @transaction.prompt_for_payment(input: input)
  	assert_equal(500, @transaction.amount_paid)
  end
end