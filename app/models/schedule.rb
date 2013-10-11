class Schedule < ActiveRecord::Base

  validates :stylist, presence: true, on: :update

  belongs_to :stylist
  has_many :timeslots

end