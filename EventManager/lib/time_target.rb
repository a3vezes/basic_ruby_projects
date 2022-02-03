require 'csv'
require 'time'

def most_register_by_hour
  csv = CSV.read('event_attendees.csv', headers: true)
  dates = csv['RegDate'].map do |date|
    Time.strptime(date, '%m/%d/%y %H:%M').hour
  end
  puts dates.tally
end

def most_register_by_week_day
  csv = CSV.read('event_attendees.csv', headers: true)
  dates = csv['RegDate'].map do |date|
    Time.strptime(date, '%m/%d/%y %H:%M').wday
  end
  puts dates.tally
end

most_register_by_hour
most_register_by_week_day
