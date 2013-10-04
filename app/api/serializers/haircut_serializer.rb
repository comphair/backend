class HaircutSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :price, :for_men
end