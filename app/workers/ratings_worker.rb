class RatingsWorker
  include Sidekiq::Worker

  def perform(store_id)
    store = Store.includes(:ratings).find(store_id)
    average = 0
    store.ratings.each do |rating|
      average += rating.value
    end
    store.rating = average / store.ratings.length.to_f
    store.save
  end

end