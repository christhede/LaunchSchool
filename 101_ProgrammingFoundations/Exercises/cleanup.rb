def cleanup(sentance)
  sentance.gsub(/[-+&?*']/, ' ')
end

puts cleanup("---what's my +*& line?") # == ' what s my line '