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
    validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :product_condition_id,  numericality: { other_than: 0, message: "Select" }
    validates :shipping_charge_id, numericality: { other_than: 0, message: "Select" }
    validates :shipping_area_id,  numericality: { other_than: 0, message: "Select" }
    validates :days_ship_id,  numericality: { other_than: 0, message: "Select" }
    validates :category_id,  numericality: { other_than: 0, message: "Select" }
    validates :image
  end
end
