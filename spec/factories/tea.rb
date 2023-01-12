FactoryBot.define do
 factory :tea do
  title { Faker::Tea.variety }
  description { Faker::Tea.type }
  temperature { Faker::Number.between(from: 170, to: 220) }
  brew_time { Faker::Number.number(digits: 1) }
 end
end