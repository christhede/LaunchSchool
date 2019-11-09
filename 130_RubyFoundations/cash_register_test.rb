
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'


class CashRegisterTest < Minitest::Test
	def setup
		@register = CashRegister.new(500)
		@transaction = Transaction.new(500)
	end

	def test_accept_money
		@transaction.amount_paid = 500

		previous_amount = @register.total_money
		@register.accept_money(@transaction)
		current_amount = @register.total_money

		assert_equal(previous_amount + 500, current_amount)
	end

	def test_change
		@transaction.amount_paid = 600
		change = @register.change(@transaction)
		assert_equal(100, change)
	end

	def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end