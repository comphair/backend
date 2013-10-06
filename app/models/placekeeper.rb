class Placekeeper < ActiveRecord::Base

  validates :session_key, presence: true
  validates :start_minutes, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1440 }
  validates :haircut, presence: true
  validates :timeslot, presence: true

  validate :prevents_holes

  belongs_to :haircut
  belongs_to :timeslot

  after_initialize :generate_session_key

  def generate_session_key
    self.session_key = SecureRandom.uuid  unless self.session_key
  end

  def prevents_holes

  end

end