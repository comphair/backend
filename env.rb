require "grape"
require "grape-active_model_serializers"
require "active_record"
require "activevalidators"
require "geocoder"

require "./app/api/base"

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/config/initializers/*.rb"].each {|f| require f}

env = ENV["ENV"] ||= "development"

ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml"))[env])

case env
when "development"
  require "grape-swagger"
  require "pry"
  require "awesome_print"
  require "better_errors"
  require "sidekiq/web"
when "testing"
  require "rack/test"
  require "database_cleaner"
  require "factory_girl"
  FactoryGirl.find_definitions
end