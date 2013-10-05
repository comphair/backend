require File.join(File.dirname(__FILE__), '../spec_helper')

describe YelpStoreWorker do

  it "should fetch the average rating" do
    address = FactoryGirl.build(:address, {
      street: "1758 1st Ave",
      zipcode: "10128",
      city: "New York",
      state: "NY",
      country: "United States"
      })
    store = FactoryGirl.create(:store, title: "Samar Spa & salon", address: address)
    worker = YelpStoreWorker.new
    worker.perform(store.id)
    store = Store.find(store.id)
    expect(store.rating).to eq 2
  end

end
