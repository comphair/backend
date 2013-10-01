ENV["ENV"] = "testing"

require "./env"

RSpec.configure do |config|

  include Rack::Test::Methods

  def app
    self.described_class
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

end

DatabaseCleaner.strategy = :truncation
