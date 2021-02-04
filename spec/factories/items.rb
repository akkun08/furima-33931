FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    item_detail { Faker::Lorem.sentence }
    category_id { 3 }
    shipping_charge_id { 2 }
    prefecture_id { 4 }
    state_id { 4 }
    delivery_id { 2 }
    price { 333333 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.jpg"), filename: "test_image.jpg")
    end
  end
end
