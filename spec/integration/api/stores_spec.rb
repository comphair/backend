require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Stores do

  describe "GET /stores" do

    before(:each) do

    end

    it "should return " do
      get "/stores", {
        coordinate: {
          latitude: 40.780056,
          longitude: -73.946570
        }
      }
      # puts last_response.body
      # JSON.parse(last_response.body)["customer"].should == { "id" => 1, "name" => "John Doe" }
    end

  end

end