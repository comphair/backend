class Address < ActiveRecord::Base

  validates :first_name, :last_name, :street, :city, :country, presence: true
  validates :zipcode, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  belongs_to :store

end