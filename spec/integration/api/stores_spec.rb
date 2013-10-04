require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Stores do

  describe "GET /stores" do

    before(:each) do
      [{
        title: "Samar Spa & salon",
        rating: 5,
        address: { # coordiantes (40.780056, -73.946570)
          street: "1758 1st Ave",
          zipcode: "10128",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Jean Louis David",
        rating: 4,
        address: {
          street: "1180 Avenue of the Americas #2",
          zipcode: "10036",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Yves Durif Salon",
        rating: 3,
        address: {
          street: "35 E 76th St",
          zipcode: "10021",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Samar Spa & salon",
        rating: 2,
        address: {
          street: "172 W 85th St",
          zipcode: "10024",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }].each do |store|
        store[:address] = FactoryGirl.build(:address, store[:address])
        FactoryGirl.create(:store, store)
      end
    end

    it "should return stores near (40.780056, -73.946570)" do
      expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/basic.json')).read
      get "/stores", {
        coordinate: {
          latitude: 40.780056,
          longitude: -73.946570
        }
      }
      expect(last_response.status).to be 200
      expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
    end

  end

end