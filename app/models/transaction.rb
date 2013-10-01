class Transaction < ActiveRecord::Base

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :tip, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :appointment
  belongs_to :invoice

end