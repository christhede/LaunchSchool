name = "Robert"
chunk_of_code = Proc.new { puts "Hi #{name}"}

def hello(greeting)
	greeting.call
end

hello(chunk_of_code)
chunk_of_code.call