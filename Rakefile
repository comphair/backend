require "./env"
require 'active_record/schema_dumper'

namespace :db do

  db_config = YAML::load(File.open('config/database.yml'))[ENV["ENV"]]

  task :connect do
    ActiveRecord::Base.establish_connection(db_config)
  end

  task :connect_admin do
    db_config_admin = db_config.merge({'database' => 'postgres', 'schema_search_path' => 'public'})
    ActiveRecord::Base.establish_connection(db_config_admin)
  end

  desc "Create the database"
  task :create => :connect_admin do
    ActiveRecord::Base.connection.create_database(db_config["database"])
    puts "Database created."
  end

  desc "Migrate the database"
  task :migrate => :connect do
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Migrator.migrate("db/migrate/")
    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  desc "Drop the database"
  task :drop => :connect_admin do
    ActiveRecord::Base.connection.drop_database(db_config["database"])
    puts "Database deleted."
  end

  desc "Seed the database"
  task :seed => :connect do
    seed_data = YAML::load(File.open('db/seeds.yml')).recursive_symbolize_keys!
    seed_data[:stores].each do |store_data|
      store_data[:address] = FactoryGirl.build(:address, store_data[:address])
      store_data[:haircuts].each_with_index do |haircut_data, index|
        store_data[:haircuts][index] = FactoryGirl.build(:haircut, haircut_data)
      end
      store = FactoryGirl.create(:store, store_data)
    end
    seed_data[:customers].each { |customer_data| FactoryGirl.create(:customer, customer_data) }
    puts "Database seeded."
  end

  desc "Reset the database"
  task :reset => [:drop, :create, :migrate, :seed]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
class #{migration_class} < ActiveRecord::Migration

  def self.up
  end

  def self.down
  end

end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end

class Hash
  def recursive_symbolize_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end
end