class ShippingMethod < ApplicationRecord

  # アソシエーション
  has_many :items
end
