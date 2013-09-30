class CreateHairdressers < ActiveRecord::Migration

  def self.up
    create_table :hairdressers do |t|
      t.string :app_id, null: false
      t.string :app_secret, null: false
      t.string :api_key, null: false
    end
  end

  def self.down
    drop_table :hairdressers
  end

end