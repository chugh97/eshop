# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create!(name: 'Toiletries')
p1 = Product.create!(name: 'Radox', category: category, description: "Radox Men's shower gel")
p2 = Product.create!(name: 'Imperial Leather', category: category, description: "Bar Soap 200gm")
p3 = Product.create!(name: 'Sunsense', category: category, description: "Sunsense sun cream 100gm")

ProductPrice.create!(product: p1, price: 1.99, effective_start_date: 1.day.ago)
ProductPrice.create!(product: p2, price: 2.69, effective_start_date: 1.day.ago)
ProductPrice.create!(product: p3, price: 14.99, effective_start_date: 1.day.ago)


