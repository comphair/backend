class Haircut < ActiveRecord::Base

  validates :duration, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :for_men, inclusion: { in: [true, false] }

  belongs_to :store
  has_many :appointments
  has_many :placekeepers

end