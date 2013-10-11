ENV["ENV"] = "testing"

require "simplecov"
SimpleCov.start

if ENV["TRAVIS"]
  require "coveralls"
  Coveralls.wear!
end

require "./env"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# disable sidekiq calls
module Sidekiq::Worker::ClassMethods
  def perform_async(*args)
    nil
  end
end