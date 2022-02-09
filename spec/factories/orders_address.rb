FactoryBot.define do
  factory :order_address do
    post_code       {'000-0000'}
    prefecture_id   {'2'}
    city            {'品川区'}
    biru_name       {'建物'}
    address         {Faker::Address.street_address}
    tel             {'00000000000'} 
    token           {'token'}

  end
end
