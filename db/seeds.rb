# stores
store = Store.new({
  title: "Samar Spa & salon",
  description: "Samar Spa & salon",
  rating: 5
  })
store.save(validate: false)
store.create_address!({ # (40.780056, -73.946570)
  first_name: "John",
  last_name: "Doe",
  street: "1758 1st Ave",
  street_additional: "2nd floor",
  zipcode: "10128",
  city: "New York",
  state: "NY",
  country: "United States",
  email: "john@doe.com1",
  phone: "+1 201-369-7000"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Jean Louis David",
  description: "Jean Louis David",
  rating: 4.5
  })
store.save(validate: false)
store.create_address!({
  first_name: "John",
  last_name: "Doe",
  street: "1180 Avenue of the Americas #2",
  street_additional: "2nd floor",
  zipcode: "10036",
  city: "New York",
  state: "NY",
  country: "United States",
  email: "john@doe.com2",
  phone: "+1 201-369-7000"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Yves Durif Salon",
  description: "Yves Durif Salon",
  rating: 3
  })
store.save(validate: false)
store.create_address!({
  first_name: "John",
  last_name: "Doe",
  street: "35 E 76th St",
  street_additional: "2nd floor",
  zipcode: "10021",
  city: "New York",
  state: "NY",
  country: "United States",
  email: "john@doe.com3",
  phone: "+1 201-369-7000"
  })
store.create_schedule
store.save!

store = Store.new({
  title: "Salon West",
  description: "Salon West",
  rating: 1
  })
store.save(validate: false)
store.create_address!({
  first_name: "John",
  last_name: "Doe",
  street: "172 W 85th St",
  street_additional: "2nd floor",
  zipcode: "10024",
  city: "New York",
  state: "NY",
  country: "United States",
  email: "john@doe.com4",
  phone: "+1 201-369-7000"
  })
store.create_schedule
store.save!

# customers
5.times do |i|
  Customer.create!({
    name: "Customer ##{i}"
    })
end