class ProductAddresse
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :token
  end

    validates :shipping_area_id, numericality: { other_than: 1, message: "Select"}
    validates :phone_number, numericality: { only_integer: true}
  def save
    product =  Product.create(user_id: user_id, item_id: item_id)
    Addresse.create(postal_code: postal_code, shipping_area_id: shipping_area.id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end