require "./spec/spec_helper"

RSpec.configure do |config|

  include Rack::Test::Methods

  def app
    self.described_class
  end

end