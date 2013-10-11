class Stylist < ActiveRecord::Base

  validates :schedule, :store, presence: true, on: :update

  belongs_to :store
  has_one :schedule

end