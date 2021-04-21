FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '渋谷区' }
    buyer_address { '道玄坂2-1' }
    building_name {'渋谷ビル'}
    phone_number { "00000000000" }
  end
end
