# stores
store = Store.new({
  title: "Samar Spa & salon",
  description: "Samar Spa & salon",
  rating: 5
  })
store.save(validate: false)
store.create_address({
  first_name: "John",
  last_name: "Doe",
  street: "1758 1st Ave",
  zipcode: "10128",
  city: "New York",
  country: "United States"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Jean Louis David",
  description: "Jean Louis David",
  rating: 4.5
  })
store.save(validate: false)
store.create_address({
  first_name: "John",
  last_name: "Doe",
  street: "1180 Avenue of the Americas #2",
  zipcode: "10036",
  city: "New York",
  country: "United States"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Yves Durif Salon",
  description: "Yves Durif Salon",
  rating: 3
  })
store.save(validate: false)
store.create_address({
  first_name: "John",
  last_name: "Doe",
  street: "35 E 76th St",
  zipcode: "10021",
  city: "New York",
  country: "United States"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Salon West",
  description: "Salon West",
  rating: 1
  })
store.save(validate: false)
store.create_address({
  first_name: "John",
  last_name: "Doe",
  street: "172 W 85th St",
  zipcode: "10024",
  city: "New York",
  country: "United States"
  })
store.create_schedule
store.save!

ap Address.all

# customers
5.times do |i|
  Customer.create!({
    name: "Customer ##{i}"
    })
end