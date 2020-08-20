FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.characters(number: 41) }
    comment           { Faker::Lorem.characters(number: 1001) }
    category_id       { '5' }
    product_status_id { '5' }
    fee_id            { '5' }
    prefecture_id     { '5' }
    delivery_day_id   { '5' }
    cost              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
