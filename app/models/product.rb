class Product < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :addresse
end