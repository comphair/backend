require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Customers do

  describe "POST /customers" do
    it "should return a new customer" do
      post "/customers", name: "John Doe"
      expect(last_response.status).to be 201
      expect(JSON.parse(last_response.body)["customer"]).to eq({
        "id" => 1,
        "name" => "John Doe"
        })
    end
  end

end