# iterate through the month, starting at the first day, checking to see if it is a :weekday, if it is,
# push that days month date to a new array.
# grab the day from the array that we push to include?(args)
# example: 
# arr[-1] == last
# arr[0] == first
# arr[1] == second
# arr[2] == third
# arr.select { |x| TEETH.include? x } 
# mday 

MDAY = {
'monday' => 1,
'tuesday' => 2,
'wednesday' => 3,
'thursday'=>  4,
'friday' => 5,
'saturday'=>  6,
'sunday' => 7
}

require 'date'

TEETH = %w(13 14 15 16 17 18 19)
  
class Meetup
  def initialize(month, year)
    @date = Date.new(year, month)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    selected_weekdays_of_the_month = []
    new_date = @date
    until new_date == @date.next_month
      selected_weekdays_of_the_month << new_date.day.to_s if new_date.cwday == MDAY[weekday.to_s]
      new_date = new_date.next_day
    end
    
    day = ''
    case schedule
    when :first   then day = selected_weekdays_of_the_month[0]
    when :second  then day = selected_weekdays_of_the_month[1]
    when :third   then day = selected_weekdays_of_the_month[2]
    when :fourth  then day = selected_weekdays_of_the_month[3]
    when :last    then day = selected_weekdays_of_the_month[-1]
    when :teenth  then selected_weekdays_of_the_month.each {|x| day = x if TEETH.include? x }
    end
    
    Date.new(@year, @month, day.to_i)
  end

end

# weekday is :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
# and schedule is :first, :second, :third, :fourth, :last or :teenth.

# What calendar day does the 'schedule' 'weekday' of the month land on?

# Meetup.new(5, 2013).day(:monday, :teenth)
# Meetup.new(8, 2013).day(:monday, :teenth)
# Meetup.new(5, 2013).day(:tuesday, :first)