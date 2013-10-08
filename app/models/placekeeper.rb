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
    gap = start_minutes - timeslot.start_minutes
    errors.add(:start_minutes, "must not be less than timeslot start_minutes")  if gap < 0

    all_haircuts = haircut.store.haircuts
    has_a_hole = true
    all_haircuts.each do |haircut_to_check|
      if gap % haircut_to_check.duration == 0
        has_a_hole = false
        break
      end
    end
    errors.add(:start_minutes, "must align to all haircuts (hole prevention)")  if has_a_hole
  end

end