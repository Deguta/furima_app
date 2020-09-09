class Item < ApplicationRecord

  # アソシエーション
  has_many               :comments,  dependent: :destroy
  has_many               :item_image
  belongs_to             :user
  belongs_to             :category
  belongs_to             :brand
  belongs_to             :condition
  belongs_to             :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to             :shipping_day
  belongs_to             :item_size
  belongs_to             :shipping_method
  belongs_to             :buyer

  # バリデーション
  validates :prefecture,    presence: true
end
