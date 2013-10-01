class Schedule < ActiveRecord::Base

  belongs_to :store
  has_many :timeslots

end