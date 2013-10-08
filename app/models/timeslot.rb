class Timeslot < ActiveRecord::Base

  validates :date, date: true
  validates :start_minutes, :end_minutes, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1440 }
  validates :schedule, presence: true, on: :update
  validate :not_overlapping

  belongs_to :schedule
  has_many :appointments
  has_many :placekeepers

  def not_overlapping
    errors.add(:start_minutes, "must be smaller than end_minutes")  if start_minutes >= end_minutes
    other_timeslots = schedule.timeslots.where(date: date).reject { |timeslot| timeslot == self }
    other_timeslots.each do |timeslot|
      if timeslot.start_minutes <= start_minutes and start_minutes <= end_minutes
        errors.add(:start_minutes, "must not be within other timeslot")
      end
      if timeslot.start_minutes <= end_minutes and end_minutes <= end_minutes
        errors.add(:end_minutes, "must not be within other timeslot")
      end
    end
  end

end