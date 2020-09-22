class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  has_many               :comments,  dependent: :destroy
  has_many               :item_images, dependent: :destroy
  belongs_to             :user
  belongs_to             :buyer, optional: true
  belongs_to_active_hash :prefecture

  # バリデーション
  validates :description,   presence: true
  validates :category,      presence: true
  validates :condition,     presence: true
  validates :shipping_cost, presence: true
  validates :prefecture,    presence: true
  validates :shipping_day,  presence: true
  validates :price,         presence: true

  # 出品機能で記述
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
