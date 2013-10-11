class StylistSerializer < ActiveModel::Serializer
  attributes :name, :description
  has_one :schedule
end