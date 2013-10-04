class Schedule < ActiveRecord::Base

  validates :store, presence: true, on: :update

  belongs_to :store
  has_many :timeslots

end