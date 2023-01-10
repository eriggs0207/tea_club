FactoryBot.define do
  factory :tea, class: Tea do
    title {Faker::Tea.variety }
    description {Faker::Coffee.notes}
    temperature {Faker::Name.name}
    brew_time {Faker::Name.name}
  end
end
