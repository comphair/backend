class StoreSerializer < ActiveModel::Serializer
  attributes :title, :description, :rating
  has_one :address
  has_one :schedule
end