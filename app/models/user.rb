class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # バリデーションの設定(空の文字列を保存させない為と一意性制約)
    validates :nickname,               presence: true
    validates :encrypted_password,     presence: true, length: { minimum: 7 }
    validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day,              presence: true
    
    # アソシエーション
    has_many   :cards,          dependent: :destroy
    has_many   :shipping_infos, dependent: :destroy
    has_many   :comments,       dependent: :destroy
    has_many   :items
    has_many :buyers
    has_many :items, through: :buyers
end
