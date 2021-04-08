FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"testtest2"}
    password_confirmation {password}
    last_name_kanji {"山田"}
    first_name_kanji {"太郎"}
    last_name_katakana {"ヤマダ"}
    first_name_katakana {"タロウ"}
    birthday {"1990-1-1"}
  end
end