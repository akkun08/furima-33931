FactoryBot.define do
  factory :purchase_purchase_address do
    postal_code { "123-4566" }
    prefecture_id { 3 }
    municipality { "大阪市"}
    address { "3-3"}
    building_name { "辻ビル"}
    phone_number { "12345678901"}
    token { "tok_abcdefghijk00000000000000000"}
  end
end
