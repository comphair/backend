require "./spec/spec_helper"
require "active_record"

Dir["#{File.dirname(__FILE__)}/app/helpers/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/models/*.rb"].each {|f| require f}