require File.join(File.dirname(__FILE__), 'spec_helper')

describe Address do

  describe "geocoding" do

    it "should adjust coordinates after validation" do
      Geocoder.configure(:lookup => :test)
      Geocoder::Lookup::Test.add_stub("96 E 7th St, 10009 New York, United States", [{ 'latitude' => 40.7143528, 'longitude' => -74.0059731 }])
      address = Address.new({
        street: "96 E 7th St",
        zipcode: "10009",
        city: "New York",
        country: "United States"
      })
      address.latitude.should == 0
      address.longitude.should == 0
      address.valid?
      address.latitude.should == 40.7143528
      address.longitude.should == -74.0059731
    end

  end

end