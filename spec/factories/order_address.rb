FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { '5' }
    city          { 'city' }
    house_number  { 'house123' }
    phone_number  { '12345678910' }
    token {"user_token"}
  end
end
