class Address < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  validates :first_name, :last_name, :street, :city, :state, :country, presence: true
  validates :zipcode, postal_code: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :email, uniqueness: true, email: true
  validates :phone, phone: true
  validates :store, presence: true, on: :update

  geocoded_by :to_s
  after_validation :geocode, :if => Proc.new { |a| a.zipcode_changed? || a.street_changed? || a.city_changed? || a.country_changed? || a.state_changed? }

  belongs_to :store

  def to_s
    "#{street}, #{zipcode} #{city}, #{state}, #{country}"
  end

end