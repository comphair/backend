class CreateStores < ActiveRecord::Migration

  def self.up
    create_table :stores do |t|
      t.string :title, null: false
      t.float :rating, null: false, default: 0
      t.text :description, null: false
    end
  end

  def self.down
    drop_table :stores
  end

end