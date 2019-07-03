require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Test < MiniTest::Test
  def boolean
    assert_equal(true, list.include? 'xyz')
  end
end

asser_raise(NoExperienceError) { employee.hire }

assert_equal(true, value.class == Numeric)

assert_instance_of Numeric, value

assert_instance_of Numeric, Value

class Test < MiniTest::Test


assert_equal(true, list == list.process)
assert_instance_of List, list

array.each do |item|
  assert_equal(true, item == 'xyz')
end

assert_equal(true, list.include 'xyz')