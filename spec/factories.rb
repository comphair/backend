FactoryGirl.define do

  factory :store do
    title         "Teststore"
    description   { "Description of #{title}" }
    rating        0
    after(:build) do |store|
      store.address = FactoryGirl.build(:address, store: store) unless store.address
      store.stylists = FactoryGirl.build_list(:stylist, 2, store: store) if store.stylists.empty?
      store.haircuts = FactoryGirl.build_list(:haircut, 5, store: store) if store.haircuts.empty?
    end
    before(:create) do |store|
      store.save!(validate: false)
    end
    after(:create) do |store|
      store.address.save!
      store.stylists.each { |stylist| stylist.save! }
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

  factory :stylist do
    name        "Max Payne"
    description "I'm am a super awesome stylist. Pick me!"
    after(:build) do |stylist|
      stylist.schedule = FactoryGirl.build(:schedule, stylist: stylist) unless stylist.schedule
    end
  end

  factory :schedule do

  end

  factory :customer do
    name  "John Wayne"
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