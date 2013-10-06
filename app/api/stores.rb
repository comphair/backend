class API::Stores < API::Base

  desc "Find stores"
  params do
    group :coordinate do
      requires :latitude, type: Float, desc: "Latitude coordinate"
      requires :longitude, type: Float, desc: "Longitude coordinate"
    end
    requires :for_men, type: Boolean, desc: "Looking for stores with men haircut or not"
    optional :date, type: Date, desc: "Specific day or start day for range query"
    optional :end_date, type: Date, desc: "End day for range query"
  end
  get 'stores' do
    location = [params[:coordinate][:latitude], params[:coordinate][:longitude]]
    addresses = Address.includes(store: [:haircuts, schedule: :timeslots]).near(location, 1) # 1 mile radius
    stores = []
    addresses.each do |address|
      store = address.store
      filtered_haircuts = []
      store.haircuts.each do |haircut|
        filtered_haircuts << haircut if haircut.for_men == params[:for_men]
      end
      # store.haircuts = filtered_haircuts
      store.distance = address.distance # trim precsion
      stores << store unless filtered_haircuts.empty?
    end
    stores = stores.sort_by! { |store| - store.rating }
    stores = stores.sort_by! { |store| store.distance }
  end

end