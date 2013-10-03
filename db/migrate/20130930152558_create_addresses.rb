class CreateAddresses < ActiveRecord::Migration

  def self.up
    create_table :addresses do |t|
      t.belongs_to :store, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street, null: false
      t.string :street_additional, null: true
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.float :latitude, null: false, default: 0
      t.float :longitude, null: false, default: 0
    end
  end

  def self.down
    drop_table :addresses
  end

end
