FactoryBot.define do
  factory :subscription, class: Subscription do

    title {Faker::Name.name}
    price {Faker::Name.name}
    status {Faker::Name.name}
    frequency {Faker::Name.name}
    association :customer, factory: :customer
    association :tea, factory: :tea
  end
end
