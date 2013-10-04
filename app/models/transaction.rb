class Transaction < ActiveRecord::Base

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :tip, numericality: { greater_than_or_equal_to: 0 }
  validates :appointment, presence: true, on: :update
  validates :invoice, presence: true, on: :update

  belongs_to :appointment
  belongs_to :invoice

end