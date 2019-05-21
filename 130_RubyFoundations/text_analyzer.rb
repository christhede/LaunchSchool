class TextAnalyzer
  def process
    file = File.open('simple_text.txt', 'r') 
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |item| puts "#{item.split.count} words" }
analyzer.process { |item| puts "#{item.split("\n").count} words" }
analyzer.process { |item| puts "#{item.split("\n\n").count} words" }
# analyzer.process { |item| puts item.inspect }
# analyzer.process { |item| puts "#{item.to_s.split.count} words" }

