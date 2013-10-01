class API::Customers < API::Base

  desc "Create a new customer"
  params do
    requires :name, type: String, desc: "name of the customer"
  end
  post 'customers' do
    Customer.create!({
      name: params[:name]
      })
  end

end