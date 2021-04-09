FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name {Faker::Name.name}
    explanation {Faker::Lorem.sentence}
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    delivery_source_id { 2 }
    days_to_ship_id { 2 }
    price { 1000 }

    association :user
  end
end
