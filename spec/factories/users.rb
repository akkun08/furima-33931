FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    japanese_last_name { "山田 " }
    japanese_first_name { "明弘" }
    kana_last_name { "ヤマダ" }
    kana_first_name { "アキヒロ" }
    year_month_day { "1932-05-08" }
  end
end
