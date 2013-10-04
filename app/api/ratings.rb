class API::Ratings < API::Base

  desc "Create a new rating"
  params do
    requires :store_id, type: Integer, desc: "Store id"
    requires :customer_id, type: Integer, desc: "Customer id"
    requires :value, type: Integer, desc: "The actual rating value"
    requires :comment, type: String, desc: "Comment"
  end
  post 'ratings' do
    rating = Rating.create!({
      store_id: params[:store_id],
      customer_id: params[:customer_id],
      value: params[:value],
      comment: params[:comment]
      })
    RatingsWorker.perform_async(params[:store_id])
    rating
  end

end