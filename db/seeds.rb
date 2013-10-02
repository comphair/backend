5.times do |i|
  store = Store.new({
    title: "Store ##{i + 1}",
    description: "A store with id #{i + 1}.",
    rating: i / 5
    })
  store.save(validate: false)
  store.create_address({
    first_name: "John",
    last_name: "Doe",
    street: "a",
    zipcode: 12432,
    city: "New York",
    country: "USA"
    })
  store.create_schedule
  store.save!
end

5.times do |i|
  Customer.create!({
    name: "Customer ##{i}"
    })
end