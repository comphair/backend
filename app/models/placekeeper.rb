class Placekeeper < ActiveRecord::Base

  validates :session_key, presence: true
  validates :haircut, presence: true, on: :update
  validates :timeslot, presence: true, on: :update

  belongs_to :haircut
  belongs_to :timeslot

  after_initialize :generate_session_key

  def generate_session_key
    self.session_key = SecureRandom.uuid  unless self.session_key
  end

end