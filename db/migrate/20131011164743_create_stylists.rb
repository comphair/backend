class CreateStylists < ActiveRecord::Migration

  def self.up
    create_table :stylists do |t|
      t.belongs_to :store, null: false
      t.string :name, null: false
      t.text :description, null: false
    end
  end

  def self.down
    drop_table :stylists
  end

end
