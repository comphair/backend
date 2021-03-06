class CreateInvoices < ActiveRecord::Migration

  def self.up
    create_table :invoices do |t|
      t.belongs_to :store, null: false
      t.integer :timespan, null: false
      t.integer :number_transactions, null: false, default: 0
      t.float :total, null: false, default: 0
    end
  end

  def self.down
    drop_table :invoices
  end

end
