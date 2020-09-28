class Buyer < ApplicationRecord

  # アソシエーション
  has_one :item
  has_one :user
end
