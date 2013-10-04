require File.join(File.dirname(__FILE__), 'spec_helper')

describe Address do

  describe "geocoding" do

    it "should adjust coordinates after validation" do
      Geocoder.configure(:lookup => :test)
      Geocoder::Lookup::Test.add_stub("96 E 7th St, 10009 New York, NY, United States", [{ 'latitude' => 40.7143528, 'longitude' => -74.0059731 }])
      address = FactoryGirl.build(:address_with_store, {
        street: "96 E 7th St",
        zipcode: "10009",
        city: "New York",
        state: "NY",
        country: "United States"
      })
      expect(address.latitude).to eq 0
      expect(address.longitude).to eq 0
      expect(address.valid?).to be true
      expect(address.latitude).to eq 40.7143528
      expect(address.longitude).to eq -74.0059731
    end

  end

end