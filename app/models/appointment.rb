class Appointment < ActiveRecord::Base

  validates :timeslot, presence: true
  validates :haircut, presence: true, on: :update
  validates :customer, presence: true, on: :update
  validates :transaction, presence: true, on: :update

  belongs_to :timeslot
  belongs_to :haircut
  belongs_to :customer
  has_one :transaction

end