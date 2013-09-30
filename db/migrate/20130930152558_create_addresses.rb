class CreateAddresses < ActiveRecord::Migration

  def self.up
    create_table :addresses do |t|
      t.column :hairdresser_id, :integer, null: false
      t.column :first_name, :string
      t.column :last_name, :string
    end
  end

  def self.down
    drop_table :addresses
  end

end
