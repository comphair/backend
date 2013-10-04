require "./spec/spec_helper"

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.clean
  end

end