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
      get "/stores", {
        coordinate: {
          latitude: 40.780056,
          longitude: -73.946570
        }
      }
      expect(last_response.status).to be 200
      expect(JSON.parse(last_response.body)).to eq([{
        "title" => "Samar Spa & salon",
        "description" => "Description of Samar Spa & salon",
        "rating" => 5.0,
        "distance"=>"9.81875190767056e-13",
        "address" => {
          "first_name" => "John",
          "last_name" => "Doe",
          "street" => "1758 1st Ave",
          "street_additional" => "96 E 7th St",
          "zipcode" => "10128",
          "city" => "New York",
          "state" => "NY",
          "country" => "United States",
          "phone" => "+1 201-369-7000"
        },
        "schedule" => {
          "timeslots" => []
        }
      }, {
        "title" => "Yves Durif Salon",
        "description" => "Description of Yves Durif Salon",
        "rating" => 3.0,
        "distance"=>"0.955709268872731",
        "address" => {
          "first_name" => "John",
          "last_name" => "Doe",
          "street" => "35 E 76th St",
          "street_additional" => "96 E 7th St",
          "zipcode" => "10021",
          "city" => "New York",
          "state" => "NY",
          "country" => "United States",
          "phone" => "+1 201-369-7000"
        },
        "schedule" => {
          "timeslots" => []
        }
      }])
    end

  end

end