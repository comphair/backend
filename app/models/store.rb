class Store < ActiveRecord::Base

  validates :title, :description, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :address, :schedule, :invoices, presence: true

  before_validation :check_invoices

  has_many :ratings
  has_many :invoices
  has_many :haircuts
  has_one :schedule
  has_one :address

  def check_invoices
    if invoices.where(timespan: Time.current_total_month).empty?
      invoices.create!({
        timespan: Time.current_total_month
        })
    end
  end

end