class YelpStoreWorker
  include Sidekiq::Worker

  def perform(store_id)
    store = Store.includes(:address).find(store_id)
    uri = URI.parse('http://api.yelp.com/business_review_search')
    params = {
      :term => store.title,
      :lat => store.address.latitude,
      :long => store.address.longitude,
      :limit => 1,
      :ywsid => 'CJRL8dGuXfHOTd2tXmw9uw'
    }
    uri.query = URI.encode_www_form(params)
    response = JSON.parse(Net::HTTP::get(uri))
    rating = response["businesses"][0]["avg_rating"]
    store.rating = rating
    store.save!
  end

end