class CreateHairdressers < ActiveRecord::Migration

  def self.up
    create_table :hairdressers do |t|
      t.string :title, null: false, default: 'New hairdresser'
    end
  end

  def self.down
    drop_table :hairdressers
  end

end