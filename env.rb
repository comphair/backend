require "grape"
require "active_record"
require "validates_timeliness"

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}

env = ENV["ENV"] ||= "development"

ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml"))[env])

case env
when "development"
  require "grape-swagger"
  require "pry"
  require "awesome_print"
  require "better_errors"

  API::Root.add_swagger_documentation mount_path: "/docs",
                                      hide_documentation_path: true
when "testing"
  require "rack/test"
  require 'database_cleaner'
end

