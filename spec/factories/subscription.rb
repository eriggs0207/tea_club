FactoryBot.define do
  factory :subscription, class: Subscription do

    title {Faker::Hipster.word}
    price {Faker::Number.between(from: 10.00, to: 250.00)}
    status { rand(0..1) }
    frequency { rand(0..2) }
    association :customer, factory: :customer
    association :tea, factory: :tea
  end
end
