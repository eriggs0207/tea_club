# frozen_string_literal: true

FactoryBot.define do
  factory :tea, class: Tea do
    title { Faker::Tea.variety }
    description { Faker::Coffee.notes }
    temperature { Faker::Number.between(from: 90, to: 210) }
    brew_time { Faker::Number.between(from: 2, to: 30) }
  end
end
