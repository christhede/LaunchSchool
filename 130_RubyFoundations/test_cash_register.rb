require 'Minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 50
  end

  def test_accept_money
    initial_amount = @register.total_money
    @register.accept_money(@transaction)

    assert_equal(initial_amount + 50, @register.total_money)
  end

  def test_change
    # change = @transaction.amount_paid - @transaction.item_cost
    change = @register.change(@transaction)
    assert_equal(25, change)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    def test_prompt_for_payment
      transaction = Transaction.new(30)
      input = StringIO.new('30\n')
      transaction.prompt_for_payment(input: input)
      assert_equal 30, transaction.amount_paid
    end
  end
end