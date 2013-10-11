class CreateSchedules < ActiveRecord::Migration

  def self.up
    create_table :schedules do |t|
      t.belongs_to :stylist, null: false
    end
  end

  def self.down
    drop_table :schedules
  end

end
