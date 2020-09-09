class ShippingCost < ApplicationRecord

  # アソシエーション
  has_many :items

  # バリデーション
  validates :cost,       presence: true
end
