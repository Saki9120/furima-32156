FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_kana             {"タナカ"}
    first_kana            {"タロウ"}
    birthday              {Faker::Date.in_date_period(year: 1993, month: 1)}
  end
end