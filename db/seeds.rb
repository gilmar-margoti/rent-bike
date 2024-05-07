# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Bike.destroy_all
User.destroy_all

jane = User.create!(name: 'Jane Doe', email: 'jane.doe@gmail.com', password: 'ilovelewagon')

Bike.create!(category: 'boardman road bike', price_per_day: 5.00, location: "greenwich park", condition: 4, user: jane)
Bike.create!(category: 'e bike', price_per_day: 25.00, location: "dalston", condition: 3, user: jane)
Bike.create!(category: 'bmx', price_per_day: 3.00, location: "seven sisters", condition: 1, user: jane)




















# create_table "bikes", force: :cascade do |t|
#   t.string "location"
#   t.decimal "price_per_day"
#   t.string "type"
#   t.integer "condition"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_bikes_on_user_id"
# end
