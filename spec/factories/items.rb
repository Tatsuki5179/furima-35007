FactoryBot.define do

  factory :item do
    product_name             {"hoge"}
    product_description      {Faker::Lorem.sentence}
    product_condition_id     {2}
    shipping_charge_id       {2}
    shipping_area_id         {2}
    days_ship_id             {2}
    category_id              {2}
    product_price            { 9999 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end  
end
