class Address < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  validates :first_name, :last_name, :street, :city, :country, presence: true
  validates :zipcode, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :store, presence: true

  geocoded_by :to_s
  after_validation :geocode, :if => Proc.new { |a| a.zipcode_changed? || a.street_changed? || a.city_changed? || a.country_changed? }

  belongs_to :store

  def to_s
    "#{street}, #{zipcode} #{city}, #{country}"
  end

end