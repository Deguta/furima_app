class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # バリデーションの設定(空の文字列を保存させない為と一意性制約)
    validates :nickname,          presence: true
    validates :family_name,       presence: true
    validates :family_name_kana,  presence: true
    validates :first_name,        presence: true
    validates :first_name_kana,   presence: true
    validates :birth_day,         presence: true
    
    # アソシエーション
    has_many :cards,          dependent: :destroy
    has_many :shipping_infos, dependent: :destroy
    has_many :comments,       dependent: :destroy
    has_many :items
end
