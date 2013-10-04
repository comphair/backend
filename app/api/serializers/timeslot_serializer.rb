class TimeslotSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_minutes, :end_minutes
end