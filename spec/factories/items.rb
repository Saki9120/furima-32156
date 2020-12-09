FactoryBot.define do
  factory :item do
    image           { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    name            {"aaaaaa"}
    description     {"aaaaaa"}
    price           {"2000"}
    category_id     {"2"}
    condition_id    {"2"}
    postage_id      {"2"}
    prefecture_id   {"2"}
    days_to_ship_id {"2"}
    association :user 
  end
end
