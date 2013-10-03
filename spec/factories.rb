FactoryGirl.define do

  factory :store do
    title         "Teststore"
    description   "Description of the teststore"
    rating        4.5
    association   :address, strategy: :build
    association   :schedule, strategy: :build
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
    email               "john#{Time.now.to_i}@doe.com"
    after(:build) do |address|
      address.store = FactoryGirl.build(:store, address: address)
    end
  end

  factory :schedule do

  end

end