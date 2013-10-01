class Haircut < ActiveRecord::Base

  validates :value, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  belongs_to :store
  belongs_to :customer

end