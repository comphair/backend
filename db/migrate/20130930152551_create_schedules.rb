class CreateSchedules < ActiveRecord::Migration

  def self.up
    create_table :schedules do |t|
      t.column :hairdresser_id, :integer, null: false
    end
  end

  def self.down
    drop_table :schedules
  end

end
