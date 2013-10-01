require "active_record"

Dir["#{File.dirname(__FILE__)}/app/models/*.rb"].each {|f| require f}