# frozen_string_literal: true

FactoryBot.define do
  factory :subscription, class: Subscription do
    title { Faker::Hipster.word }
    price { Faker::Number.between(from: 10.00, to: 250.00).round(2) }
    status { 0 }
    frequency { rand(0..2) }
    association :customer, factory: :customer
    association :tea, factory: :tea
  end
end
