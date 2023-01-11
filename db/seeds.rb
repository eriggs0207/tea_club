# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
6.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    address: Faker::Address.full_address
  )
end

customers = Customer.all

20.times do
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Coffee.notes,
    temperature: Faker::Number.between(from: 90, to: 210),
    brew_time: Faker::Number.between(from: 2, to: 30)
  )
end

teas = Tea.all

Subscription.create!(
  customer_id: customers[0].id,
  tea_id: teas[0].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)

Subscription.create!(
  customer_id: customers[0].id,
  tea_id: teas[1].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[1].id,
  tea_id: teas[1].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[1].id,
  tea_id: teas[2].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[2].id,
  tea_id: teas[3].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[2].id,
  tea_id: teas[4].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[3].id,
  tea_id: teas[5].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[3].id,
  tea_id: teas[6].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[4].id,
  tea_id: teas[7].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[4].id,
  tea_id: teas[8].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[5].id,
  tea_id: teas[9].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
Subscription.create!(
  customer_id: customers[5].id,
  tea_id: teas[0].id,
  title: Faker::Hipster.word,
  price: Faker::Number.between(from: 10.00, to: 250.00).round(2),
  status: rand(0..1),
  frequency: rand(0..2)
)
