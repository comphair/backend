class Timeslot < ActiveRecord::Base

  validates :date, date: true
  validates :schedule, presence: true, on: :update
  validate :do_it

  belongs_to :schedule
  has_many :appointments
  has_many :placekeeper

  # TODO
  def do_it
    true
  end

end