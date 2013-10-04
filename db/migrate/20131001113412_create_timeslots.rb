class CreateTimeslots < ActiveRecord::Migration

  def self.up
    create_table :timeslots do |t|
      t.belongs_to :schedule, null: false
      t.date :date, null: false
      t.integer :start_minutes, null: false
      t.integer :end_minutes, null: false
    end
  end

  def self.down
    drop_table :timeslots
  end

end
