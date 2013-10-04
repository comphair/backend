class Invoice < ActiveRecord::Base

  validates :total, :number_transactions, :timespan, numericality: { greater_than_or_equal_to: 0 }
  validates :store, presence: true, on: :update

  belongs_to :store
  has_many :transactions

end