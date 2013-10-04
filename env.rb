require "grape"
require "grape-active_model_serializers"
require "active_record"
require "activevalidators"
require "sidekiq"
require "geocoder"

env = ENV["ENV"] ||= "development"

if ["development", "testing"].include? env
  require "pry"
  require "binding_of_caller"
  require "awesome_print"
  require "factory_girl"
  FactoryGirl.find_definitions
end

case env
when "development"
  require "grape-swagger"
  require "better_errors"
  require "sidekiq/web"
when "testing"
  require "rack/test"
  require "database_cleaner"
end

ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml"))[env])

require "./app/api/base"

Dir["#{File.dirname(__FILE__)}/app/api/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/api/serializers/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/helpers/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/models/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/workers/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/config/initializers/*.rb"].each {|f| require f}

if env == "development"
  require "./app/api/helpers/base"
  Dir["#{File.dirname(__FILE__)}/app/api/helpers/*.rb"].each {|f| require f}
end