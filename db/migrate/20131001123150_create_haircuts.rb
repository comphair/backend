class CreateHaircuts < ActiveRecord::Migration

  def self.up
    create_table :haircuts do |t|
      t.belongs_to :store, null: false
      t.string :name, null: false
      t.float :price, null: false
      t.integer :duration, null: false
      t.boolean :for_men, null: false
    end
  end

  def self.down
    drop_table :haircuts
  end

end
