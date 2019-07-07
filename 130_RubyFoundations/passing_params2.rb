items = %w(raven finch hawk eagle)


def gather(items)
  yield(items)
end

# puts items
# gather(items) { |items| puts items }
gather(items) { |_, _, *raptors| puts raptors } 