class CreatePlacekeepers < ActiveRecord::Migration

  def self.up
    create_table :placekeepers do |t|
      t.belongs_to :timeslot, null: false
      t.belongs_to :haircut, null: false
      t.string :session_key, null: false
      t.integer :start_minutes, null: false
    end
  end

  def self.down
    drop_table :placekeepers
  end

end
