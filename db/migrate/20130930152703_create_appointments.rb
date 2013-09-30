class CreateAppointments < ActiveRecord::Migration

  def self.up
    create_table :appointments do |t|
      t.column :date, :string
    end
  end

  def self.down
    drop_table :appointments
  end

end
