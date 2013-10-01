ENV["ENV"] = "testing"

require "./env"

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  include Rack::Test::Methods

  def app
    self.described_class
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

end