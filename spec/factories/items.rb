FactoryBot.define do
  factory :item do
    image
    item_name { Faker::Lorem.sentence }
    item_detail { Faker::Lorem.sentence }
    category_id { 3 }
    shipping_charge_id { 2 }
    prefecture_id { 4 }
    delivery_id { 2 }
    price { 333333 }

    association :user
    after(:build) do |message|
      message.image.attach(io: File.open("public/images/test_image.jpg"), filename: "test_image.jpg")
    end
  end
end
