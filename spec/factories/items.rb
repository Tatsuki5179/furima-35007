FactoryBot.define do


  factory :item do
    product_name             {"hoge"}
    product_description      {Faker::Lorem.sentence}
    product_condition_id     {1}
    shipping_charge_id       {1}
    shipping_area_id         {1}
    days_ship_id             {1}
    product_price            {"9999"}
    user_id                  {1}
  end
end
