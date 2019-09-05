# based on series.size, use times to iterate through series.

class Series
  def initialize(series)
    @series = series
  end

  def slices(slice)
    raise ArgumentError if slice > @series.size
    arr = []
    beginner = 0
    until @series[beginner+slice-1] == nil
      arr << @series[beginner..beginner + slice-1]
      beginner += 1
    end
    arr
  end
end

series = Series.new('92834')
p series.slices(6)