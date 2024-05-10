puts "Cleaning database..."
Bike.destroy_all
User.destroy_all
Booking.destroy_all

# USERS
puts "Creating users..."
gilmar = User.create!(first_name: "Gilmar", last_name: "Margoti", profile: "", email: "gilmar@gmail.com",      password: "123456")
ella   = User.create!(first_name: "Ella",   last_name: "Pierri",  profile: "", email: "ellajpierre@gmail.com", password: "123456")
max    = User.create!(first_name: "Max",    last_name: "Cody",    profile: "", email: "codym08@gmail.com",     password: "123456")
puts "Users created successfully..."

# BIKES
puts "Creating bikes..."
Bike.create!(location: "Putney",           price_per_day: 5.00,  category: "Road bike",    condition: 3, user: gilmar)
# Bike.create!(location: "Shoreditch",       price_per_day: 25.00, category: "Eletric bike", condition: 5, user: ella)
Bike.create!(location: "Richmond london",         price_per_day: 15.00, category: "Road bike",    condition: 4, user: max)
Bike.create!(location: "Fulham",           price_per_day: 8.00,  category: "Hybrid bike",  condition: 3, user: gilmar)
Bike.create!(location: "Soho",             price_per_day: 10.00, category: "BMX",          condition: 3, user: ella)
Bike.create!(location: "Acton",            price_per_day: 13.00, category: "Road bike",    condition: 3, user: max)
Bike.create!(location: "Battersea",        price_per_day: 6.00,  category: "Hybrid bike",  condition: 2, user: gilmar)
Bike.create!(location: "Clapham Junction", price_per_day: 8.00,  category: "Road bike",    condition: 2, user: ella)
puts "Bicycles created successfully..."

locations = [
  "London", "wembley", "whitechapel", "temple london", "southwark", "bermondsey",
  "rotherhithe", "belgravia", "notting hill", "silvertown", "poplar", "Brixton",
  "blackwall", "millwall", "bexleyheath", "bayswater", "westbourne green", "somers town", "clerkenwell",
  "brompton", "kensington", "lewisham", "deptford", "westiminster", "lambeth", "surrey quays",
  "finsbury park", "farringdon", "limehouse"
]
puts "Creating bikes..."
40.times do
  location = locations.sample
  price_per_day = rand(5..30).round(2)
  category = ["Road bike", "Electric bike", "Hybrid bike", "BMX"].sample
  condition = rand(1..5)
  user = [gilmar, ella, max].sample  # Assuming gilmar, ella, max are predefined users
  Bike.create!(location: location, price_per_day: price_per_day, category: category, condition: condition, user: user)
end
puts "Bicycles created successfully..."
puts "Finished"
