# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create!(first_name: 'Ally', last_name: 'Mo', email: 'moballyally@guhmail.com', address: '601 Lakeshore Drive')
customer2 = Customer.create!(first_name: 'Ray', last_name: 'Charles', email: 'raybay@guhmail.com', address: '6875 Three O Nine Place')

subscription = customer.subscriptions.create!(title: 'Tea Musketeers', price: 14.99, status: 0, frequency: 0)
subscription2 = customer2.subscriptions.create!(title: 'Early Grey', price: 24.99, status: 0, frequency: 0)