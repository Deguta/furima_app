class ShippingInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # バリデーションの設定(空の文字列を保存させない為と一意性制約)
  validates :family_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,        presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :prefecture,        presence: true
  validates :postal_code,       presence: true
  validates :city,              presence: true
  validates :address,           presence: true
end
