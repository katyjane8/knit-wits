# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 16 items
require 'csv'

CSV.foreach("./data/categories.csv", headers: true, header_converters: :symbol) do |row|
  Category.create!(name: row[:name],
                   slug: row[:slug],
                   image: row[:image])
end

CSV.foreach("./data/items.csv", headers: true, header_converters: :symbol) do |row|
  Item.create!(title: row[:title],
               description: row[:description],
               price: row[:price],
               image: Rails.root.join("app/assets/images/products/#{row[:image]}").open,
               status: row[:status].to_i)
end

CSV.foreach("./data/retired_items.csv", headers: true, header_converters: :symbol) do |row|
  RetiredItem.create!(item_id: row[:item_id])
end

CSV.foreach("./data/item_categories.csv", headers: true, header_converters: :symbol) do |row|
  ItemCategory.create!(item_id: row[:item_id],
                       category_id: row[:category_id])
end

CSV.foreach("./data/users.csv", headers: true, header_converters: :symbol) do |row|
  User.create!(username: row[:username],
               password: rand(10000).to_s,
               role: 0,
               full_name: row[:full_name],
               street: row[:street],
               city: row[:city],
               state: row[:state].to_i,
               zipcode: row[:zipcode])
end

CSV.foreach("./data/orders.csv", headers: true, header_converters: :symbol) do |row|
  Order.create!(status: row[:status].to_i,
                user_id: row[:user_id].to_i,
                created_at: row[:created_at],
                updated_at: row[:updated_at])
end

CSV.foreach("./data/order_items.csv", headers: true, header_converters: :symbol) do |row|
  OrderItem.create!(item_id: row[:item_id].to_i,
                    order_id: row[:order_id].to_i,
                    quantity: row[:quantity].to_i)
end
