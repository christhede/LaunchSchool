require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = car1.name

    assert_equal(car1, car2)          # this will pass
    assert_same(car1, car2)           # this will fail
  end
end