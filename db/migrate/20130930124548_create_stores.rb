class CreateStores < ActiveRecord::Migration

  def self.up
    create_table :stores do |t|
      t.column :title, :string, null: false
      t.column :rating, :float, null: false, default: 0
      t.column :description, :text, null: false
    end
  end

  def self.down
    drop_table :stores
  end

end