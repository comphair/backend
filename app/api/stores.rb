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
    addresses = Address.includes(store: :haircuts).near(location, radius)
    stores = []
    addresses.each do |address|
      store = address.store.attributes
      # store = address.store

      filtered_haircuts = []
      # store.haircuts.each do |haircut|
      address.store.haircuts.each do |haircut|
        unless params.has_key?("for_men") and haircut.for_men != params[:for_men]
          filtered_haircuts << haircut.attributes
        end
      end
      # store.haircuts = filtered_haircuts
      store["haircuts"] = filtered_haircuts

      store["distance"] = address.distance
      # store.distance = address.distance
      stores << store
    end
    stores
  end

end