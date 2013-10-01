class CreateAppointments < ActiveRecord::Migration

  def self.up
    create_table :appointments do |t|
      t.belongs_to :timeslot, null: false
      t.belongs_to :haircut, null: false
      t.belongs_to :customer, null: false
      t.integer :start_minutes, null: false
      t.text :comment, null: true
    end
  end

  def self.down
    drop_table :appointments
  end

end
