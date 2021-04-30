FactoryBot.define do
  factory :product_addresse do
      postal_code         {'123-4567'}
      city                {'東京都'} 
      house_number        {'1-1'}
      phone_number        {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }      
      building_name       {'東京ハイツ'}
      shipping_area_id      {2}
      token               {"tok_abcdefghijk00000000000000000"}
  end
end
