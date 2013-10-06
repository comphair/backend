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
    # disable sidekiq calls
    # module Sidekiq::Worker::ClassMethods
    #   def perform_async(*args)
    #     nil
    #   end
    # end
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