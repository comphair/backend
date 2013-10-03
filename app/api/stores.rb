class API::Stores < API::Base

  desc "Find stores"
  params do
    group :coordinate do
      requires :latitude, type: Float, desc: "Latitude coordinate"
      requires :longitude, type: Float, desc: "Longitude coordinate"
    end
    optional :date, type: Date, desc: "Specific day or start day for range query"
    optional :end_date, type: Date, desc: "End day for range query"
    optional :for_men, type: Boolean, desc: "Looking for stores with men haircut or not"
  end
  get 'stores' do
    location = [params[:coordinate][:latitude], params[:coordinate][:longitude]]
    radius = 1
    addresses = Address.includes(:store).near(location, radius)
    stores = []
    addresses.each do |address|
      stores.push address.store
    end
    stores
  end

end