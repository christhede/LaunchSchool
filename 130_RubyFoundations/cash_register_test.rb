require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
	def setup
		@register = CashRegister.new(50)
		@transaction = Transaction.new(25)
		@transaction.amount_paid = 30
	end

	def test_accept_money
		previous_amount = @register.total_money
		@register.accept_money(@transaction)
		current_amount = @register.total_money

		assert_equal(80, current_amount)
	end

	def test_cash_register_change
		previous_amount = @register.total_money
		@register.accept_money(@transaction)
		current_amount = @register.total_money

		assert_equal(5, @register.change(@transaction))
	end

	def test_give_receipt
		assert_equal("You've paid $25.", @register.give_receipt(@transaction))
	end
end