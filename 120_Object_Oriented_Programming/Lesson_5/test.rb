module Swimmable
	def swim
		"is swimming!"
	end

	def to_s
		"#{@name} #{swim}"
	end
end

class Cat
	include Swimmable

	def initialize(name)
		@name = name
	end


end

kitty = Cat.new('kitty')
puts kitty