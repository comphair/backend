FactoryGirl.define do

  factory :store do
    title         "Teststore"
    description   { "Description of #{title}" }
    rating        0
    after(:build) do |store|
      store.address = FactoryGirl.build(:address, store: store) unless store.address
      store.schedule = FactoryGirl.build(:schedule, store: store) unless store.schedule
      store.haircuts = FactoryGirl.build_list(:haircut, 5, store: store) if store.haircuts.empty?
    end
    before(:create) do |store|
      store.save!(validate:false)
    end
    after(:create) do |store|
      store.address.save!
      store.schedule.save!
      store.haircuts.each { |haircut| haircut.save! }
    end
  end

  factory :address do
    first_name          "John"
    last_name           "Doe"
    street              "96 E 7th St"
    street_additional   "96 E 7th St"
    zipcode             "10009"
    city                "New York"
    state               "NY"
    country             "United States"
    phone               "+1 201-369-7000"
    email               { "john#{SecureRandom.uuid}@doe.com" }

    factory :address_with_store do
      after(:build) do |address|
        address.store = FactoryGirl.build(:store, address: address) unless address.store
      end
    end

  end

  factory :schedule do

  end

  factory :customer do
    name  "John Doe"
  end

  factory :haircut do
    name      "Men Standard"
    duration  20
    price     14.99
    for_men   true
  end

  factory :rating do
    value     5
    comment   "This is a senseless comment."
  end

  factory :timeslot do

  end

  factory :placekeeper do

  end

end