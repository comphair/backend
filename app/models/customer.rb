class Customer < ActiveRecord::Base

  validates :name, presence: true

  has_many :appointments
  has_many :ratings

end