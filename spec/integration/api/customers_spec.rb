require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Customers do

  describe "POST /customer" do
    it "should return a new customer" do
      post "/customer", name: "John Doe"
      last_response.status.should == 201
      JSON.parse(last_response.body)["customer"].should == { "id" => 1, "name" => "John Doe" }
    end
  end

end