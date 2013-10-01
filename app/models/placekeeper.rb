class Placekeeper < ActiveRecord::Base

  validates :session_key, presence: true

  belongs_to :haircut
  belongs_to :timeslot

end