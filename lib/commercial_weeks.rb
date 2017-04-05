require "commercial_weeks/version"
require 'date'
require 'time'
require 'active_support/core_ext/date/calculations'
require 'active_support/time'

module CommercialWeeks
  def self.week_dates(week_num, year)
    week_start = Date.commercial(year, week_num, 1)
    week_end = Date.commercial(year, week_num, 7)
    week_end = Date.new(year).end_of_year if week_end.year > week_start.year
    [week_start.strftime('%d %b, %Y'), week_end.strftime('%d %b, %Y')].join(' - ')
  end

  def self.weeks_count(year)
    last_day = Date.new(year).end_of_year
    last_day.cweek == 1 ? last_day.prev_week.cweek : last_day.cweek
  end

  def self.get_first_week(year=Time.now.year)
    return [] if Date.new(year).wday == 1
    weeks = []
    weeks << [Date.civil(year, 1, 1).strftime('%d %b, %Y'), Date.civil(year, 1, 1).sunday.strftime('%d %b, %Y')].join(' - ')
  end

  def self.calculate_weeks(start_date, end_date, year)
    (start_date..end_date).collect{ |week_num| week_dates(week_num, year) }
  end

  def self.previous_half_year_weeks(year)
    week_number = Date.parse("#{year}-7-1").strftime("%V").to_i
    total_weeks = weeks_count(year)
    calculate_weeks(week_number, total_weeks, year)
  end

  def self.next_half_year_weeks(year)
    week_number = Date.parse("#{year}-6-30").cweek
    get_first_week(year) | calculate_weeks(1, week_number, year)
  end

  def self.compute_weeks(year=Time.now.year)
    number_of_weeks = weeks_count(year)
    previous_half_year_weeks(year - 1) | get_first_week(year) | calculate_weeks(1, number_of_weeks, year) | next_half_year_weeks(year + 1)
  end

  def self.current_week(current_date)
    current_date = Date.today if current_date.blank?
    end_date = current_date.next_year.year == current_date.sunday.year ? current_date.end_of_year : current_date.sunday
    end_date = end_date.strftime('%d %b, %Y')
    start_date = current_date.strftime('%d %b, %Y')
    [start_date, end_date].join(' - ')
  end

  def self.start_date_of_week(date)
    date.year == date.monday.year ? date.monday : date.beginning_of_year
  end
end
