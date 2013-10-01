class API::Stores < API::Base

  desc "Find stores"
  params do
    requires :location, type: String, desc: "name of the customer"
  end
  post 'customer' do
    Customer.create!({
      name: params[:name]
      })
  end

end