source "https://rubygems.org"

gem "grape"
gem "grape-active_model_serializers"
gem "activerecord", "~>3.2.14"
gem "activevalidators"
gem "pg"
gem "sidekiq"
gem "geocoder"

group :development do
  gem "sinatra" # needed for sidekiq
  gem "grape-swagger", "~>0.6.0"
  gem "rake", "~>10.1.0"
  gem "pry"
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "rerun", "~>0.8.1"
  gem "guard", "~>1.8.1"
  gem "guard-rspec", "~>3.0.2"
  gem "racksh"
end

group :testing do
  gem "database_cleaner"
  gem "factory_girl"
  gem "rack-test"
  gem "rspec"
end