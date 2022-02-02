FactoryBot.define do
  factory :item do
    product_name            {"aa"}
    expianation             {"aa"}
    category_id             {'2'}
    product_situation_id    {'2'}
    delivery_charge_id      {'2'}
    prefecturse_id          {'2'}
    delivery_day_id         {'2'}
    price                   {'3000'}

    association :user

    after(:build) do |items|
      items.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    end
  end