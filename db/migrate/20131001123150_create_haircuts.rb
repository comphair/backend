class CreateHaircuts < ActiveRecord::Migration

  def self.up
    create_table :haircuts do |t|
      t.belongs_to :store, null: false
      t.decimal :price, null: false, default: 0
      t.integer :duration, null: false, default: 0
    end
  end

  def self.down
    drop_table :haircuts
  end

end
