class Invoice < ActiveRecord::Base

  validates :total, :number_transactions, :timespan, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :store
  has_many :transactions

end