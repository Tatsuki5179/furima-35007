class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_ship
  belongs_to :product_condition
  belongs_to :shipping_area
  belongs_to :shipping_charge

with_options presence: true do
  validates :product_name
  validates :product_description
  validates :image
end
   with_options numericality: { other_than: 1, message: "Select" } do
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_ship_id
    validates :category_id
   end

   with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
    validates :product_price
  end
end