class CreateTransactions < ActiveRecord::Migration

  def self.up
    create_table :transactions do |t|
      t.belongs_to :appointment, null: false
      t.belongs_to :invoice, null: false
      t.decimal :total, null: false
      t.decimal :tip, null: false, default: 0
    end
  end

  def self.down
    drop_table :transactions
  end

end
