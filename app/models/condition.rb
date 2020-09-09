class Condition < ApplicationRecord

  # アソシエーション
  has_many :items

  # バリデーション
  validates :condition,       presence: true
end
