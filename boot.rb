# TODO: put in ENV
require "pry"
require "awesome_print"
require "better_errors"
require "grape"
require "active_record"

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}

ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml")))

ApplicationServer = Rack::Builder.new do
  use BetterErrors::Middleware
  run API::Hairdressers
end