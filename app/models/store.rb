class Store < ActiveRecord::Base

  validates :title, :description, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  has_many :ratings
  has_many :invoices
  has_many :haircuts
  has_one :schedule

end