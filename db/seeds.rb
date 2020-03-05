require 'faker'

price_ranges = ['$', '$$', '$$$']

puts "Destroying database"

Basket.destroy_all
Restaurant.destroy_all
Product.destroy_all

puts "Seeding fresh new stuff..."

User.create(email: 'test@gmail.com', role: 'owner', password: '123456', admin: true)

5.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, category: Faker::Restaurant.type,
  description: Faker::Restaurant.description, rating: rand(1.0..5.0),
  address: Faker::Address.street_address, user_id: 1, price_range: price_ranges.sample)
end

10.times do
  Product.create(name: Faker::Food.dish, price: rand(1..25), description: Faker::Food.description)
end

Basket.create(name: 'Goodies', description: 'Some stuff', date: Date.today, restaurant_id: Restaurant.first.id, stock: 2, price: 6)

puts "Seeded:"
puts "- a user with 5 restaurants"
puts "- 10 products"
puts "- 1 basket"
