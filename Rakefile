require "active_record"

ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml")))

namespace :db do

  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Schema.define do
      create_table :albums do |table|
        table.column :title, :string
        table.column :performer, :string
      end

      create_table :tracks do |table|
        table.column :album_id, :integer
        table.column :track_number, :integer
        table.column :title, :string
      end
    end
  end

  desc "Seed the database"
  task :seed do

  end

end
