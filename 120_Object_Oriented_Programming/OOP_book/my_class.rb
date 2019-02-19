module Oopsies
  def oopsies(string)
    puts "#{string}"
  end
end

class MyClass
  include Oopsies
end

my_obj = MyClass.new

my_obj.oopsies('wowzers')