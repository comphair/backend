class AddressSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :street, :street_additional, :zipcode, :city, :state, :country, :phone
end