class CreateRatings < ActiveRecord::Migration

  def self.up
    create_table :ratings do |t|
      t.belongs_to :store, null: false
      t.belongs_to :customer, null: false
      t.integer :value, null: false
      t.text :comment, null: false
    end
  end

  def self.down
    drop_table :ratings
  end

end
