require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Stores do

  describe "GET /stores" do

    before(:each) do
      [{
        # id: 1,
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
        # id: 2,
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
        # id: 3,
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
        # id: 4,
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
          duration: 25,
          price: 24.99,
          for_men: false
          })
        store = FactoryGirl.create(:store, store)
        store.stylists.each { |stylist| stylist.delete }
        stylist = FactoryGirl.create(:stylist, {
          store: store,
          name: "Some Guy",
          description: "Pick me!"
          })
        store.stylists << stylist
        stylist.schedule.timeslots << FactoryGirl.create(:timeslot, {
          schedule: stylist.schedule,
          date: Date.new(2011,11,11),
          start_minutes: 0,
          end_minutes: 1440
          })
      end
    end

    context "when searching near (40.780056, -73.946570)" do

      it "should find for men" do
        expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/today_for_men.json')).read
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: true,
          start_date: Date.new(2011,11,11),
          end_date: Date.new(2011,11,11)
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      end

      it "should find for women" do
        expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/today_for_women.json')).read
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: false,
          start_date: Date.new(2011,11,11),
          end_date: Date.new(2011,11,11)
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      end

      it "should find for women within week range" do
        expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/today_for_women.json')).read
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: false,
          start_date: Date.new(2011,11,07),
          end_date: Date.new(2011,11,14)
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      end

      it "should find for women within month range" do
        expected_response = File.open(File.join(File.dirname(__FILE__), 'responses/stores/today_for_women.json')).read
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: false,
          start_date: Date.new(2011,10,11),
          end_date: Date.new(2011,12,11)
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq(JSON.parse(expected_response))
      end

      it "should find nothing" do
        get "/stores", {
          coordinate: {
            latitude: 40.780056,
            longitude: -73.946570
          },
          for_men: false,
          start_date: Date.new(2011,11,12),
          end_date: Date.new(2011,11,12)
        }
        expect(last_response.status).to be 200
        expect(JSON.parse(last_response.body)).to eq([])
      end

    end

  end

end