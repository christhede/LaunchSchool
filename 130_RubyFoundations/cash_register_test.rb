require "minitest/autorun"
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(4000)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money
    
    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    @transaction.amount_paid = 25

    assert_equal 5, @register.change(@transaction)
  end

  def test_give_receipt
    @transaction.amount_paid = 20
    assert_output("You've paid $20.\n") { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new('20\n')
    @transaction.prompt_for_payment(input: input)
    assert_equal 20, @transaction.amount_paid
  end
end