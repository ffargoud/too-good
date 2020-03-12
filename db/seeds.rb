require 'faker'

price_ranges = ['$', '$$', '$$$']

puts "Destroying database"

Order.destroy_all
Basket.destroy_all
Product.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Seeding fresh new stuff..."

User.create!(email: 'test@gmail.com', role: 'owner', password: '123456', admin: true)
User.create!(email: 'argoud.fanny@gmail.com', role: 'owner', password: '123456', admin: true)

manifest = Restaurant.new(name: "Manifest",
  category: "healthy",
  description: "Pretty nice restaurant with a proper dose of vintage flavour. The staff is friendly and helpful.",
  rating: rand(1.0..5.0),
  address: "Rua da Sociedade Farmaceutica 31, Lisbon 1150-338, Portugal",
  user: User.first,
  price_range: price_ranges.sample)
manifest.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584029273/manifest_kpfg63.png')
manifest.photo.attach(io: file, filename: 'manifest_kpfg63.png', content_type: 'image/png')

padaria1 = Restaurant.new(name: "A Padaria Portuguesa - Alcântara",
  category: "Padaria",
  description: "Temos 60 lojas na grande Lisboa, que lhe oferecem uma enorme variedade de pão fresco, em várias fornadas diárias, receitas caseiras e quentes para o almoço, pastelaria deliciosa e muitos outros sabores. ",
  rating: rand(1.0..5.0),
  address: "Rua Luis de Camões, 3B, Alcântara, Lisboa",
  user: User.first,
  price_range: price_ranges.sample)
padaria1.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584029458/padaria1_fkopjh.jpg')
padaria1.photo.attach(io: file, filename: 'padaria1_fkopjh.jpg', content_type: 'image/jpg')

padaria2 = Restaurant.new(name: "A Padaria Portuguesa - Almada forum",
  category: "Padaria",
  description: "Temos 60 lojas na grande Lisboa, que lhe oferecem uma enorme variedade de pão fresco, em várias fornadas diárias, receitas caseiras e quentes para o almoço, pastelaria deliciosa e muitos outros sabores. ",
  rating: rand(1.0..5.0),
  address: "Praça São Joao Baptista, 1 (Av. D. Nuno Alvares Pereira), 2800-199 Almada, Portugal",
  user: User.first,
  price_range: price_ranges.sample)
padaria2.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584029466/padaria2_jkisre.jpg')
padaria2.photo.attach(io: file, filename: 'padaria2_jkisre.jpg', content_type: 'image/jpg')

padaria3 = Restaurant.new(name: "A Padaria Portuguesa - Alfragide",
  category: "Padaria",
  description: "Temos 60 lojas na grande Lisboa, que lhe oferecem uma enorme variedade de pão fresco, em várias fornadas diárias, receitas caseiras e quentes para o almoço, pastelaria deliciosa e muitos outros sabores. ",
  rating: rand(1.0..5.0),
  address: "Avenida da Quinta Grande, 28, Alfragide, Amadora",
  user: User.first,
  price_range: price_ranges.sample)
padaria3.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584030232/padaria3_qwcvse.jpg')
padaria3.photo.attach(io: file, filename: 'padaria3_qwcvse.jpg', content_type: 'image/jpg')

copenhagen1 = Restaurant.new(name: "Copenhagen Coffee Lab - Alfama",
category: "Padaria",
description: "",
rating: rand(1.0..5.0),
address: "Alfama, Escolas Gerais 34, 1100-213 Lisbon, Portugal",
user: User.last,
price_range: price_ranges.sample)
copenhagen1.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584029682/copen1_bvs5ue.jpg')
copenhagen1.photo.attach(io: file, filename: 'copen1_bvs5ue.jpg', content_type: 'image/jpg')

copenhagen2 = Restaurant.new(name: "Copenhagen Coffee Lab - Cais de Sodre",
category: "Padaria",
description: "",
rating: rand(1.0..5.0),
address: "Rua de Sao Paulo 60-62, 1200-019 Lisbon, Portugal",
user: User.last,
price_range: price_ranges.sample)
copenhagen2.save!

file = URI.open('https://res.cloudinary.com/dnie1qfbq/image/upload/v1584030093/copen2_vgpigb.jpg')
copenhagen2.photo.attach(io: file, filename: 'copen2_vgpigb.jpg', content_type: 'image/jpg')

10.times do
  Product.create(name: Faker::Food.dish, price: rand(1..25), description: Faker::Food.description)
end
Basket.create(name: 'Goodies', description: 'Some stuff', date: Date.today, restaurant_id: Restaurant.first.id, stock: 2, price: 6)


puts 'Finished!'
