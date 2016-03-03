500.times do
  name = Faker::Company.name
  phone_number = Faker::PhoneNumber.cell_phone
  address = Faker::Address.street_address
  Business.create(
    name: name, 
    phone_number: phone_number, 
    address: address
    )
end

