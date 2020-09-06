class ShippingInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # バリデーションの設定(空の文字列を保存させない為と一意性制約)
  validates :family_name,       presence: true
  validates :family_name_kana,  presence: true
  validates :first_name,        presence: true
  validates :first_name_kana,   presence: true
  validates :prefecture,        presence: true
end
