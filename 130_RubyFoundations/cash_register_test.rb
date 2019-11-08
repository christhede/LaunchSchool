
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
	def setup

	end

	def accept_money_test
		register = CashRegister.new(500)
		register.accept_money(500)

		assert_equal(1000, register.total_money)
	end
end