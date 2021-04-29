FactoryBot.define do
  factory :product_addresses do
    postal_code         {'123-4567'}
      city                {'東京都'} 
      house_number        {'1-1'}
      phone_number        
      building_name       {'東京ハイツ'}
      shipping_area_id      {2}
  end
end
