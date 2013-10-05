class Store < ActiveRecord::Base

  attr_accessor :distance # needed for stores api # TODO move to API

  validates :title, :description, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :address, :schedule, :invoices, presence: true, on: :update

  before_validation :check_invoices

  after_save :update_rating, :if => :title_changed?

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

  def update_rating
    YelpStoreWorker.perform_async(id)
  end

end