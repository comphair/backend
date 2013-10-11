require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Stores do

  describe "GET /stores" do

    before(:each) do
      [{
        title: "Samar Spa & salon",
        description: "Samar Spa & salon",
        rating: 5,
        address: { # coordiantes (40.780056, -73.946570)
          first_name: "John",
          last_name: "Doe",
          street: "1758 1st Ave",
          zipcode: "10128",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Jean Louis David",
        description: "Jean Louis David",
        rating: 4,
        address: {
          first_name: "John",
          last_name: "Doe",
          street: "1180 Avenue of the Americas #2",
          zipcode: "10036",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Yves Durif Salon",
        description: "Yves Durif Salon",
        rating: 3,
        address: {
          first_name: "John",
          last_name: "Doe",
          street: "35 E 76th St",
          zipcode: "10021",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }, {
        title: "Samar Spa & salon",
        description: "Samar Spa & salon",
        rating: 2,
        address: {
          first_name: "John",
          last_name: "Doe",
          street: "172 W 85th St",
          zipcode: "10024",
          city: "New York",
          state: "NY",
          country: "United States"
        }
      }].each do |store|
        store[:address] = FactoryGirl.build(:address, store[:address])
        store[:haircuts] = FactoryGirl.build_list(:haircut, 3, {
          name: "Men Standard",
          duration: 20,
          price: 14.99,
          for_men: true
          })
        store[:haircuts].concat FactoryGirl.build_list(:haircut, 3, {
          name: "Women Standard",
          duration: 20,
          price: 24.99,
          for_men: false
          })
        FactoryGirl.create(:store, store)
      end
    end

    context "when searching near (40.780056, -73.946570)" do

      it "should find for men" do
        expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/basic_for_men.json')).read
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: true
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      end

      # it "should find for women" do
      #   expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/basic_for_women.json')).read
      #   get "/stores", {
      #     coordinate: {
      #       latitude: 40.780056,
      #       longitude: -73.946570
      #     },
      #     for_men: false
      #   }
      #   ap JSON.parse(last_response.body)
      #   expect(last_response.status).to be 200
      #   expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      # end

    end

  end

end