source "https://rubygems.org"

gem "grape"
gem "activerecord", "~>3.2.14"
gem "validates_timeliness"
gem "pg"
gem "sidekiq"
gem "geocoder"

group :development do
  gem 'sinatra' # needed for sidekiq
  gem "grape-swagger"
  gem "rake", "~>10.1.0"
  gem "pry"
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "rerun"
  gem "guard"
  gem "guard-rspec"
end

group :testing do
  gem "database_cleaner"
  gem "rack-test"
  gem "rspec"
end