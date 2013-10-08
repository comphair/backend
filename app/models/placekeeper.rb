class Placekeeper < ActiveRecord::Base

  validates :session_key, presence: true
  validates :start_minutes, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1440 }
  validates :haircut, presence: true
  validates :timeslot, presence: true

  validate :within_timeslot
  validate :prevents_holes
  validate :not_overlapping

  belongs_to :haircut
  belongs_to :timeslot

  after_initialize :generate_session_key

  def generate_session_key
    self.session_key = SecureRandom.uuid  unless self.session_key
  end

  def within_timeslot
    errors.add(:start_minutes, "must not be less than timeslot start_minutes")  if start_minutes < timeslot.start_minutes
    errors.add(:start_minutes, "must be less to match timeslot")  if start_minutes + haircut.duration > timeslot.end_minutes
  end

  def prevents_holes
    gap = start_minutes - timeslot.start_minutes
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

  def not_overlapping
    other_placekeepers = timeslot.placekeepers.reject { |placekeeper| placekeeper == self }
    other_placekeepers.each do |other_placekeeper|
      other_start_minutes = other_placekeeper.start_minutes
      other_end_minutes = other_start_minutes + other_placekeeper.haircut.duration
      if other_start_minutes <= start_minutes and start_minutes < other_end_minutes
        errors.add(:start_minutes, "must not overlap other placekeeper")
      end
      own_end_minutes = start_minutes + haircut.duration
      if other_start_minutes < own_end_minutes and own_end_minutes <= other_end_minutes
        errors.add(:start_minutes, "must not overlap other placekeeper")
      end
    end
  end

end