require File.join(File.dirname(__FILE__), '../spec_helper')

RSpec.configure do |config|

  include Rack::Test::Methods

  def app
    self.described_class
  end

end