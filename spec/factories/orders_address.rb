FactoryBot.define do
  factory :order_address do
    post_code {'000-0000'}
    prefecture_id {'東京都'}
    city {'品川区'}
    address {Faker::Address.street_address}
    biru_name {'建物'}
    tel {'00000000000'} 
  end
end
