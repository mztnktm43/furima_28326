FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "pass123" }
    password_confirmation { password }
    family_name           { 'かなカナ仮名' }
    first_name            { 'かなカナ仮名' }
    family_name_reading   { 'カナ' }
    first_name_reading    { 'カナ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 70) }
  end
end
