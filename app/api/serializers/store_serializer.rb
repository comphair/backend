class StoreSerializer < ActiveModel::Serializer
  attributes :title, :description, :rating, :distance
  has_one :address
  has_one :schedule
end