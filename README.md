# CommercialWeeks

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/commercial_weeks`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'commercial_weeks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install commercial_weeks

## Usage

Computes start date and end date for week
  `CommercialWeeks.week_dates(week_num, year)`

Computes number of weeks in a year
  `CommercialWeeks.weeks_count(year)`

Compute first week of the year
  `CommercialWeeks.get_first_week(year=Time.now.year)`

Calculate weeks based the startign and  ending weeks
  `CommercialWeeks.calculate_weeks(start_week, end_week, year)`

Calculate previous half year weeks
  `CommercialWeeks.previous_half_year_weeks(year)`

Calculate previous half year weeks
  `CommercialWeeks.next_half_year_weeks(year)`

Compute weeks  for the year
  `CommercialWeeks.compute_weeks(year=Time.now.year)`

Computes week for the given date
  `CommercialWeeks.current_week(current_date)`

Compute weeks start date
  `CommercialWeeks.start_date_of_week(date)`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/commercial_weeks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

