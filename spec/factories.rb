FactoryGirl.define do

  factory :store do
    title         "Teststore"
    description   { "Description of #{title}" }
    rating        4.5
    after(:build) do |store|
      store.address = FactoryGirl.build(:address, store: store) unless store.address
      store.schedule = FactoryGirl.build(:schedule, store: store) unless store.schedule
    end
    before(:create) do |store|
      store.save!(validate:false)
    end
    after(:create) do |store|
      store.address.save!
      store.schedule.save!
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

  end

end