require File.join(File.dirname(__FILE__), '../spec_helper')

describe RatingsWorker do

  it "should calculate the average rating" do
    store = FactoryGirl.create(:store)
    customer = FactoryGirl.create(:customer)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 1)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 2)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 3)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 4)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 5)
    store.ratings << FactoryGirl.create(:rating, store: store, customer: customer, value: 5)
    worker = RatingsWorker.new
    worker.perform(store.id)
    store = Store.find(store.id)
    expect(store.rating).to eq 3.33333333333333
  end

end
