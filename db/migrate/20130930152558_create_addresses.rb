class CreateAddresses < ActiveRecord::Migration

  def self.up
    create_table :addresses do |t|
      t.column :hairdresser_id, :integer, null: false
      t.column :first_name, :string, null: false
      t.column :last_name, :string, null: false
      t.column :street, :string, null: false
      t.column :zipcode, :string, null: false
      t.column :city, :string, null: false
      t.column :country, :string, null: false
      t.column :latitude, :float, null: false, default: 0
      t.column :longitude, :float, null: false, default: 0
    end
  end

  def self.down
    drop_table :addresses
  end

end
