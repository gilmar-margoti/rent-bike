puts "Cleaning database..."
Bike.destroy_all
User.destroy_all
Bookings.destroy_all

puts "Creating users..."
User.create!(first_name: "Gilmar", last_name: "Margoti", profile: "", email: "gilmar@gmail.com")
User.create!(first_name: "Ella",   last_name: "Pierri",  profile: "", email: "ellajpierre@gmail.com")
User.create!(first_name: "Max",    last_name: "Cody",    profile: "", email: "codym08@gmail.com")
puts "Users created successfully..."

puts "Creating bikes..."
Bike.create!(location: "Putney",           price_per_day: 5.00, category: "Road bike",     condition: 3, user_id: 1)
Bike.create!(location: "Shoreditch",       price_per_day: 25.00, category: "Eletric bike", condition: 5, user_id: 2)
Bike.create!(location: "Richmond",         price_per_day: 15.00, category: "Road bike",    condition: 4, user_id: 3)
Bike.create!(location: "Fulham",           price_per_day: 8.00, category: "Hybrid bike",   condition: 3, user_id: 1)
Bike.create!(location: "Soho",             price_per_day: 10.00, category: "BMX",          condition: 3, user_id: 3)
Bike.create!(location: "Acton",            price_per_day: 13.00, category: "Road bike",    condition: 3, user_id: 2)
Bike.create!(location: "Battersea",        price_per_day: 6.00, category: "Hybrid bike",   condition: 2, user_id: 2)
Bike.create!(location: "Clapham Junction", price_per_day: 8.00, category: "Road bike",     condition: 2, user_id: 3)
puts "Bicycles created successfully..."

puts "Finished!"
