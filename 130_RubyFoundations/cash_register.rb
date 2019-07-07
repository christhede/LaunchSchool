<<<<<<< HEAD


=======
>>>>>>> bc60058d04bf3fbca28776d23381ef4f962b9e69
# cash_register.rb

class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    transaction.amount_paid - transaction.item_cost
  end

  def give_receipt(transaction)
<<<<<<< HEAD
    puts "You've paid $#{transaction.item_cost}."
=======
    "You've paid $#{transaction.item_cost}."
>>>>>>> bc60058d04bf3fbca28776d23381ef4f962b9e69
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> bc60058d04bf3fbca28776d23381ef4f962b9e69
