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

10.times do
  name = Faker::Internet.user_name
  email = Faker::Internet.email
  User.create(
    name: name, 
    email: email, 
    )
end

