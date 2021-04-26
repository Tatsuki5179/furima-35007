class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_ship_id
    validates :category_id
    validates :image

  end
end
