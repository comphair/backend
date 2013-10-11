class Store
  attr_accessor :distance
end

class API::Stores < API::Base

  desc "Find stores"
  params do
    group :coordinate do
      requires :latitude, type: Float, desc: "Latitude coordinate"
      requires :longitude, type: Float, desc: "Longitude coordinate"
    end
    requires :for_men, type: Boolean, desc: "Looking for stores with men haircut or not"
    requires :date, type: Date, desc: "Specific day or start day for range query"
    optional :end_date, type: Date, desc: "End day for range query"
  end
  get 'stores' do
    location = [params[:coordinate][:latitude], params[:coordinate][:longitude]]
    addresses = Address.near(location, 1) # 1 mile radius
    near_stores = []
    stores = Store.includes(:address, :haircuts, stylists: { schedule: :timeslots })
                  .where(haircuts: { for_men: params[:for_men] })
                  .order("rating DESC, haircuts.id ASC")

    stores.each do |store|
      address = addresses.reject{ |address| address.store_id != store.id }.first
      if address
        store.distance = address.distance.to_f.round(2)
        near_stores << store
      end
    end

    near_stores = near_stores.sort_by! { |store| store.distance }
  end

end