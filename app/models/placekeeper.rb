class Placekeeper < ActiveRecord::Base

  validates :session_key, presence: true
  validates :haircut, presence: true, on: :update
  validates :timeslot, presence: true, on: :update

  belongs_to :haircut
  belongs_to :timeslot

end