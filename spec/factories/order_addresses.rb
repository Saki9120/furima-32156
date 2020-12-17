FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    address_line_1 { '大田区旭ヶ丘１' }
    address_line_2 { 'ハイツ東京101' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 2 }
    item_id { 2 } 
  end
end