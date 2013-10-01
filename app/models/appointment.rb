class Appointment < ActiveRecord::Base

  belongs_to :timeslot
  belongs_to :haircut
  belongs_to :customer
  has_one :transaction

end